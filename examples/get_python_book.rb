require 'rubygems'
require 'htmls_to_pdf'

# Get 'Learn Python the Hard Way' as pdf file
# Source: 'http://learnpythonthehardway.org/book/'

def python_hard_way_urls
  urls = ['http://learnpythonthehardway.org/book/intro.html']
  (0..52).each do |val|
    urls << 'http://learnpythonthehardway.org/book/ex' + val.to_s + '.html'
  end
  urls << 'http://learnpythonthehardway.org/book/next.html'
  urls << 'http://learnpythonthehardway.org/book/advice.html'
  urls
end

config[:savedir] = '~/Tech/Python/Learn_Python_the_Hard_Way'
config[:savename] = 'Learn_Python_the_Hard_Way.pdf'
config[:urls] = python_hard_way_urls
config[:css] = ['http://learnpythonthehardway.org/book/_static/basic.css']
config[:remove_temp_files] = false

HtmlsToPdf.new(config).create_pdf
