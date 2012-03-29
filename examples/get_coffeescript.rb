require 'rubygems'
require 'htmls_to_pdf'

# Get 'CoffeeScript_documentation' as pdf file
# Source: 'http://coffeescript.org/'

config = {}
config[:urls] = ['http://coffeescript.org/']
config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/DOCUMENTATION'
config[:savename] = 'CoffeeScript_documentation.pdf'
config[:css] = ['http://coffeescript.org/documentation/css/docs.css',
       'http://coffeescript.org/documentation/css/idle.css']

HtmlsToPdf.new(config).create_pdf
