require 'rubygems'
require 'htmls_to_pdf'

# Get 'CoffeeScript_documentation' as pdf file
# Source: 'http://jashkenas.github.com/coffee-script/'

urls = ['http://jashkenas.github.com/coffee-script/']
savedir = '~/Tech/Javascript/COFFEESCRIPT/DOCUMENTATION'
savename = 'CoffeeScript_documentation.pdf'
css = ['http://jashkenas.github.com/coffee-script/documentation/css/docs.css',
       'http://jashkenas.github.com/coffee-script/documentation/css/idle.css']
html_files = HtmlsToPdf.new(savedir,savename,urls,css)
html_files.create_pdf
