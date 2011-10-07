require 'rubygems'
require 'htmls_to_pdf'

# Get 'CoffeeScript_documentation' as pdf file
# Source: 'http://jashkenas.github.com/coffee-script/'

config = {}
config[:urls] = ['http://jashkenas.github.com/coffee-script/']
config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/DOCUMENTATION'
config[:savename] = 'CoffeeScript_documentation.pdf'
config[:css] = ['http://jashkenas.github.com/coffee-script/documentation/css/docs.css',
       'http://jashkenas.github.com/coffee-script/documentation/css/idle.css']

HtmlsToPdf.new(config).create_pdf
