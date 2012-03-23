require 'rubygems'
require 'htmls_to_pdf'

# Get 'Little Book on CoffeeScript' as pdf file
# Source: 'http://arcturo.github.com/library/coffeescript/index.html'

config = {}
config[:urls] = []
config[:urls] << 'http://arcturo.github.com/library/coffeescript/01_introduction.html'
config[:urls] << 'http://arcturo.github.com/library/coffeescript/02_syntax.html'
config[:urls] << 'http://arcturo.github.com/library/coffeescript/03_classes.html'
config[:urls] << 'http://arcturo.github.com/library/coffeescript/04_idioms.html'
config[:urls] << 'http://arcturo.github.com/library/coffeescript/05_compiling.html'
config[:urls] << 'http://arcturo.github.com/library/coffeescript/06_applications.html'
config[:urls] << 'http://arcturo.github.com/library/coffeescript/07_the_bad_parts.html'
config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/THE LITTLE BOOK ON COFFEESCRIPT'
config[:savename] = 'Little_Book_on_CoffeeScript.pdf'
config[:css] = ['http://arcturo.github.com/library/coffeescript/site/site.css']

HtmlsToPdf.new(config).create_pdf
