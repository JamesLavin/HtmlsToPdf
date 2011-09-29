require 'rubygems'
require 'fileutils'
require 'pdfkit'

savedir = ARGV[0] ? ARGV[0] || '~/Ruby_programs/Learn_Ruby_the_Hard_Way'

def build_urls
  urls = ['http://ruby.learncodethehardway.org/book/intro.html']
  (1..52).each do |val|
    urls << 'http://ruby.learncodethehardway.org/book/ex' + val.to_s.rjust(2,'0') + '.html'
  end
  urls << 'http://ruby.learncodethehardway.org/book/next.html'
  urls << 'http://ruby.learncodethehardway.org/book/advice.html'
  urls
end

PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
end

def set_dir(savedir)
  save_to = File.expand_path(SAVEDIR)
  FileUtils.mkdir_p(save_to)
  Dir.chdir(save_to)
end

def get_html_files(html_urls)
  existing_files = Dir.entries(".")
  html_urls.each do |url|
    savename = File.basename(url)
    unless existing_files.include?(savename)
      `wget #{url}`
    end
  end
end

def get_css_files
  existing_files = Dir.entries(".")
  `wget http://ruby.learncodethehardway.org/book/css/960gs/960.css` unless existing_files.include?("960.css")
  `wget http://ruby.learncodethehardway.org/book/css/screen.css` unless existing_files.include?('screen.css')
  `wget http://ruby.learncodethehardway.org/book/css/syntax.css` unless existing_files.include?('syntax.css')
end

def html_to_pdf(html_file)
  html = nil
  savename = html_file.sub(/\.html?$/,'.pdf')
  unless Dir.entries(".").include?(savename)
    File.open(html_file, 'r') { |inf| html = inf.read }
    kit = PDFKit.new(html, :page_size => 'Letter')
    # we don't want to use these stylesheets
    #kit.stylesheets << '960.css'
    #kit.stylesheets << 'screen.css'
    kit.stylesheets << 'syntax.css'
    kit.to_file(savename)
  end
end

def html_file_array(urls)
  urls.map { |url| File.basename(url) }
end

def pdf_file_array(html_file_array)
  html_file_array.map { |html_file| html_file.sub(/\.html?$/,'.pdf') }
end

def build_book(html_file_array)
  unless File.exists?('Learn_Ruby_the_Hard_Way.pdf')
    pdfs_string = pdf_file_array(html_file_array).join(" ")
    `pdftk #{pdfs_string} output Learn_Ruby_the_Hard_Way.pdf`
  end
end

def delete_temp_files(html_file_array)
  pdf_file_array(html_file_array).each { |pdffile| File.delete(pdffile) }
  html_file_array.each { |htmlfile| File.delete(htmlfile) }
  File.entries(".").match(/\.css$/).each { |cssfile| File.delete(cssfile) }
end

set_dir(savedir)
urls = build_urls
get_css_files
get_html_files(urls)
html_file_array = html_file_array(urls)
html_file_array.each { |html_file| html_to_pdf(html_file) }
build_book(html_file_array)
#delete_temp_files(html_file_array)

