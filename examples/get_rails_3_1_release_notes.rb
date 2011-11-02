require 'rubygems'
require 'htmls_to_pdf'

# Get 'Rails 3.1 Release Notes' as pdf file
# Source: 'http://guides.rubyonrails.org/3_1_release_notes.html'

config = {}
config[:urls] = ['http://guides.rubyonrails.org/3_1_release_notes.html']

config[:savedir] = '~/Tech/Rails/3.1'
config[:savename] = 'Rails_3.1_Release_Notes.pdf'

HtmlsToPdf.new(config).create_pdf
