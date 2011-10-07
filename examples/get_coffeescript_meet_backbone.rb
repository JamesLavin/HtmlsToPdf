require 'rubygems'
require 'htmls_to_pdf'

# Get 'CoffeeScript, Meet Backbone.js' as pdf file
# Source: 'http://adamjspooner.github.com/coffeescript-meet-backbonejs/'

config = {}
config[:urls] = ['http://adamjspooner.github.com/coffeescript-meet-backbonejs/']
(1..5).each do |val|
  config[:urls] << 'http://adamjspooner.github.com/coffeescript-meet-backbonejs/0' + val.to_s + '/docs/script.html'
end
config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/BACKBONE.JS'
config[:savename] = 'CoffeeScript_Meet_Backbone.js.pdf'
config[:css] = ['http://adamjspooner.github.com/coffeescript-meet-backbonejs/05/docs/docco.css']

HtmlsToPdf.new(config).create_pdf
