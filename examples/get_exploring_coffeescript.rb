require 'rubygems'
require 'htmls_to_pdf'

# Get 'Exploring CoffeeScript' as pdf file
# Source: 'http://elegantcode.com'

config = {}
config[:urls] = ['http://elegantcode.com/2011/06/21/exploring-coffeescript-part-1-and-then-there-was-coffee/',
        'http://elegantcode.com/2011/06/30/exploring-coffeescript-part-2-variables-and-functions/',
        'http://elegantcode.com/2011/07/13/exploring-coffeescript-part-3-more-on-functions/',
        'http://elegantcode.com/2011/07/26/exploring-coffeescript-part-4-objects-and-classes/',
        'http://elegantcode.com/2011/08/02/exploring-coffeescript-part-5-ranges-loops-and-comprehensions/',
        'http://elegantcode.com/2011/08/09/exploring-coffeescript-part-6-show-me-the-goodies/']
config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/DOCUMENTATION/Exploring_CoffeeScript'
config[:savename] = 'Exploring_CoffeeScript.pdf'

HtmlsToPdf.new(config).create_pdf
