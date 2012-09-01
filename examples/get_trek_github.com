require 'rubygems'
require 'htmls_to_pdf'

# Get 'Advice on & Instruction in the Use Of Ember.js' as pdf file
# Source: 'http://trek.github.com/'

config = {}
config[:urls] = ['http://trek.github.com/']
config[:savedir] = '~/Tech/Javascript/EMBER.JS'
config[:savename] = 'Use_of_Ember.pdf'
config[:css] = []
config[:remove_temp_files] = true
config[:debug] = true

HtmlsToPdf.new(config).create_pdf
