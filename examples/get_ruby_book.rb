require 'rubygems'
require 'htmls_to_pdf'

# Get 'Learn Ruby the Hard Way' as a pdf
# Source: 'http://ruby.learncodethehardway.org/book/'

def ruby_hard_way_urls
  urls = ['http://ruby.learncodethehardway.org/book/intro.html']
  (1..52).each do |val|
    urls << 'http://ruby.learncodethehardway.org/book/ex' + val.to_s.rjust(2,'0') + '.html'
  end
  urls << 'http://ruby.learncodethehardway.org/book/next.html'
  urls << 'http://ruby.learncodethehardway.org/book/advice.html'
  urls
end

savedir = '~/Ruby_programs/Learn_Ruby_the_Hard_Way'
savename = 'Learn_Ruby_the_Hard_Way.pdf'
urls = ruby_hard_way_urls
css = ['http://ruby.learncodethehardway.org/book/css/syntax.css']

html_files = HtmlsToPdf.new(savedir,savename,urls,css,false)
html_files.create_pdf
