require 'rubygems'
require 'fileutils'
require 'pdfkit'
require 'uri'
include URI

class HtmlsToPdf

  attr_reader :hfarray, :pdfarray, :cssarray, :urls, :savedir, :savename, :remove_temp_files

  def initialize(savedir, savename, urls_array, css_array = [], remove_temp_files = true)
    set_dir(savedir)
    @savename = savename
    exit_if_pdf_exists
    @urls = clean_urls(urls_array)
    @hfarray = get_hfarray
    @pdfarray = create_pdfarray
    @cssarray = css_array
    @remove_temp_files = remove_temp_files
  end

  def get_hfarray
    everything_after_last_slash(@urls)
  end

  def clean_urls(urls)
    remove_trailing_url_slashes(urls)
  end

  def remove_trailing_url_slashes(urls)
    urls.map { |url| url.match(/\/$/) ? url.sub(/\/$/,'') : url }
  end

  def everything_after_last_slash(urls)
    urls.map { |url| url.match(/([^\/]+)$/)[0] }
  end

  def add_dot_html(urls)
    urls.map { |url| url.match(/\.html?$/) ? url : url + '.html' }
  end

  def create_pdfarray
    html_extension = /\.html?$/
    @hfarray.map do |html_file|
      html_file.match(html_extension) ? html_file.sub(html_extension,'.pdf') : html_file + '.pdf' 
    end
  end

  def exit_if_pdf_exists
    if File.exists?(@savename)
      puts "File #{@savename} already exists. Please rename or delete and re-run this program."
      exit
    end
  end

  def set_dir(savedir)
    @savedir = savedir
    save_to = File.expand_path(savedir)
    FileUtils.mkdir_p(save_to)
    Dir.chdir(save_to)
  end

  #def add_css(css_file)
  #  @cssarray << css_file
  #end

  def download_files
    download_html_files
    download_css_files
  end

  def download_html_files
    existing_files = Dir.entries(".")
    @urls.each do |url|
      savename = File.basename(url)
      unless existing_files.include?(savename)
        `wget #{url}`
      end
    end
  end

  def download_css_files
    existing_files = Dir.entries(".")
    @cssarray.each do |css_url|
      `wget #{css_url}` unless existing_files.include?(File.basename(css_url))
    end
  end

  def generate_pdfs
    @hfarray.each_with_index { |html_file,i| html_to_pdf(html_file,@pdfarray[i]) }
  end

  def html_to_pdf(html_file,pdf_file)
    puts "creating #{pdf_file} from #{html_file}"
    html = nil
    unless Dir.entries(".").include?(pdf_file)
      File.open(html_file, 'r') { |inf| html = inf.read }
      kit = PDFKit.new(html, :page_size => 'Letter', :orientation => 'Landscape')
      @cssarray.each { |cssfile| kit.stylesheets << File.basename(cssfile) }
      kit.to_file(pdf_file)
    end
  end

  def join_pdfs
    unless File.exists?(@savename)
      pdfs_string = @pdfarray.join(" ")
      `pdftk #{pdfs_string} output #{@savename}`
    end
  end

  def delete_temp_files
    @pdfarray.each { |pdffile| File.delete(pdffile) }
    @hfarray.each { |htmlfile| File.delete(htmlfile) }
    @cssarray.each { |cssfile| File.delete(File.basename(cssfile)) }
  end

  def create_pdf
    download_files
    generate_pdfs
    join_pdfs
    delete_temp_files if @remove_temp_files
  end

end



