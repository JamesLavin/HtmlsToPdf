require 'rubygems'
require 'fileutils'
require 'pdfkit'

PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
end

class HtmlsToPdf

  attr_reader :hfarray, :pdfarray, :cssarray, :urls, :savedir, :savename

  def initialize(savedir, savename, urls_array, css_array = [], remove_temp_files = true)
    set_dir(savedir)
    @savename = savename
    @urls = urls_array
    @hfarray = urls_array.map { |url| File.basename(url) }
    @pdfarray = @hfarray.map { |html_file| html_file.sub(/\.html?$/,'.pdf') }
    @cssarray = css_array
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
    html = nil
    unless Dir.entries(".").include?(pdf_file)
      File.open(html_file, 'r') { |inf| html = inf.read }
      kit = PDFKit.new(html, :page_size => 'Letter')
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
    delete_temp_files
  end

end

def ruby_hard_way_urls
  urls = ['http://ruby.learncodethehardway.org/book/intro.html']
  (1..52).each do |val|
    urls << 'http://ruby.learncodethehardway.org/book/ex' + val.to_s.rjust(2,'0') + '.html'
  end
  urls << 'http://ruby.learncodethehardway.org/book/next.html'
  urls << 'http://ruby.learncodethehardway.org/book/advice.html'
  urls
end

def python_hard_way_urls
  urls = ['http://ruby.learncodethehardway.org/book/intro.html']
  (0..52).each do |val|
    urls << 'http://learnpythonthehardway.org/book/ex' + val.to_s + '.html'
  end
  urls << 'http://learnpythonthehardway.org/book/next.html'
  urls << 'http://learnpythonthehardway.org/book/advice.html'
  urls
end

# Ruby
# http://ruby.learncodethehardway.org/book/
#savedir = '~/Ruby_programs/Learn_Ruby_the_Hard_Way'
#savename = 'Learn_Ruby_the_Hard_Way.pdf'
#urls = ruby_hard_way_urls
#css = ['http://ruby.learncodethehardway.org/book/css/syntax.css']

# Python
# http://learnpythonthehardway.org/book/
savedir = '~/Tech/Python/Learn_Python_the_Hard_Way'
savename = 'Learn_Python_the_Hard_Way.pdf'
urls = python_hard_way_urls
css = ['http://learnpythonthehardway.org/book/_static/basic.css']
      # 'http://learnpythonthehardway.org/book/_static/sphinxdoc.css']
html_files = HtmlsToPdf.new(savedir,savename,urls,css,false)
html_files.create_pdf
