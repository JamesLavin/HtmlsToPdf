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

savedir = '~/Tech/Python/Learn_Python_the_Hard_Way'
savename = 'Learn_Python_the_Hard_Way.pdf'
urls = python_hard_way_urls
css = ['http://learnpythonthehardway.org/book/_static/basic.css']
html_files = HtmlsToPdf.new(savedir,savename,urls,css,false)
html_files.create_pdf
