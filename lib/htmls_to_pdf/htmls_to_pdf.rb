require 'rubygems'
require 'fileutils'
require 'pdfkit'
require 'uri'
include URI

class HtmlsToPdf

  attr_reader :htmlarray, :pdfarray, :cssarray, :urls, :savedir, :savename, :remove_temp_files

  TMP_HTML_PREFIX = 'tmp_html_file_'
  TMP_PDF_PREFIX = 'tmp_pdf_file_'

  def initialize(in_config = {})
    config = {
      :css => [],
      :remove_temp_files => true,
      :options => {}
    }.merge(in_config)
    set_dir(config[:savedir])
    @savename = config[:savename]
    exit_if_pdf_exists
    @urls = clean_urls(config[:urls])
    #@htmlarray = get_htmlarray
    @pdfarray = create_pdfarray
    @cssarray = config[:css]
    @remove_temp_files = config[:remove_temp_files]
    @options = config[:options]
  end

  #def initialize(savedir, savename, urls_array, css_array = [], remove_temp_files = true)
  #  set_dir(savedir)
  #  @savename = savename
  #  exit_if_pdf_exists
  #  @urls = clean_urls(urls_array)
  #  @htmlarray = get_htmlarray
  #  @pdfarray = create_pdfarray
  #  @cssarray = css_array
  #  @remove_temp_files = remove_temp_files
  #end

  def get_htmlarray
    everything_after_last_slash(@urls)
  end

  def clean_urls(urls)
    if !urls.is_a?(Array)
      urls = Array(urls) if Array(urls).is_a?(Array)
    else
      raise "config[:urls] must be an array" unless urls.is_a?(Array)
    end
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
    outarray = []
    (0...@urls.length).each do |idx|
      outarray << TMP_PDF_PREFIX + idx.to_s
    end
    outarray
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
    @htmlarray = []
    @urls.each_with_index do |url,idx|
      savename = TMP_HTML_PREFIX + idx.to_s
      unless existing_files.include?(savename)
        `wget #{url} -O #{savename}`
      end
      @htmlarray << savename
    end
  end

  def download_css_files
    existing_files = Dir.entries(".")
    @cssarray.each do |css_url|
      `wget #{css_url}` unless existing_files.include?(File.basename(css_url))
    end
  end

  def generate_pdfs
    @urls.each_with_index { |url,i| html_to_pdf(TMP_HTML_PREFIX + i.to_s,@pdfarray[i]) }
  end

  def html_to_pdf(html_file,pdf_file)
    puts "creating #{pdf_file} from #{html_file}"
    html = nil
    unless Dir.entries(".").include?(pdf_file)
      File.open(html_file, 'r') { |inf| html = inf.read }
      #kit = PDFKit.new(html, :page_size => 'Letter', :orientation => 'Landscape')
      kit = PDFKit.new(html, @options)
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
    @htmlarray.each { |htmlfile| File.delete(htmlfile) }
    @cssarray.each { |cssfile| File.delete(File.basename(cssfile)) }
  end

  def create_pdf
    download_files
    generate_pdfs
    join_pdfs
    delete_temp_files if @remove_temp_files
  end

end



