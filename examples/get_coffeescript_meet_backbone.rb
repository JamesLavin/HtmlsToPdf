require 'rubygems'
require 'htmls_to_pdf'

# Get 'CoffeeScript, Meet Backbone.js' as pdf file
# Source: 'http://adamjspooner.github.com/coffeescript-meet-backbonejs/'

urls = ['http://adamjspooner.github.com/coffeescript-meet-backbonejs/']
(1..5).each do |val|
  urls << 'http://adamjspooner.github.com/coffeescript-meet-backbonejs/0' + val.to_s + '/docs/script.html'
end
savedir = '~/Tech/Javascript/COFFEESCRIPT/BACKBONE.JS'
savename = 'CoffeeScript_Meet_Backbone.js.pdf'
css = ['http://adamjspooner.github.com/coffeescript-meet-backbonejs/05/docs/docco.css']
html_files = HtmlsToPdf.new(savedir,savename,urls,css)
html_files.create_pdf
