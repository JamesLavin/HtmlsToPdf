require 'rubygems'
require 'fileutils'
require 'pdfkit'
require 'uri'
#include URI
require 'net/http'

class HtmlsToPdf

  attr_reader :htmlarray, :pdfarray, :cssarray, :urls, :savedir, :savename, :remove_html_files, :remove_css_files, :remove_tmp_pdf_files

  TMP_HTML_PREFIX = 'tmp_html_file_'
  TMP_PDF_PREFIX = 'tmp_pdf_file_'

  def initialize(in_config = {})
    config = {
      :css => [],
      :remove_css_files => true,
      :remove_html_files => true,
      :remove_tmp_pdf_files => true,
      :overwrite_existing_pdf => false,
      :options => {},
      :savedir => File.expand_path("~"),
      :savename => 'htmls_to_pdf.pdf'
    }.merge(in_config)
    set_dir(config[:savedir])
    @savename = config[:savename]
    @overwrite_existing_pdf = config[:overwrite_existing_pdf]
    exit_if_pdf_exists unless @overwrite_existing_pdf
    @urls = clean_urls(config[:urls])
    @pdfarray = create_pdfarray
    @cssarray = config[:css].kind_of?(Array) ? config[:css] : Array[ config[:css] ]
    @remove_css_files = config[:remove_css_files]
    @remove_html_files = config[:remove_html_files]
    @remove_tmp_pdf_files = config[:remove_tmp_pdf_files]
    @remove_css_files = @remove_html_files = @remove_tmp_pdf_files = true if in_config[:remove_temp_files]
    @options = config[:options]
  end

  def create_pdf
    clean_temp_files
    download_files
    generate_pdfs
    join_pdfs
    clean_temp_files
  end

  private

  def clean_temp_files
    delete_html_files if @remove_html_files
    delete_css_files if @remove_css_files
    delete_tmp_pdf_files if @remove_tmp_pdf_files
  end

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

  def save_url_to_savename(url, savename)
    uri = URI.parse(url)
    file_content = Net::HTTP.get_response(uri).body
    File.open(savename, 'w') { |f| f.write(file_content) }
  end

  def download_html_files
    existing_files = Dir.entries(".")
    @htmlarray = []
    @urls.each_with_index do |url,idx|
      savename = TMP_HTML_PREFIX + idx.to_s
      unless existing_files.include?(savename)
        save_url_to_savename(url, savename)
        #`wget #{url} -O #{savename}`
      end
      @htmlarray << savename
    end
  end

  def download_css_files
    existing_files = Dir.entries(".")
    @cssarray.each do |css_url|
      savename = File.basename(css_url)
      next if existing_files.include?(savename)
      save_url_to_savename(css_url, savename)
      #`wget #{css_url}` unless existing_files.include?(File.basename(css_url))
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

  def delete_tmp_pdf_files
    @pdfarray.each { |pdffile| File.delete(pdffile) if File.exist?(File.basename(pdffile)) } unless @pdfarray.empty?
  end

  def delete_html_files
    to_delete = Dir.glob("#{TMP_HTML_PREFIX}*")
    to_delete.each { |f| File.delete(f) }
  end

  def delete_css_files
    @cssarray.each { |cssfile| File.delete(File.basename(cssfile)) if File.exist?(File.basename(cssfile)) } unless @cssarray.empty?
  end

end



