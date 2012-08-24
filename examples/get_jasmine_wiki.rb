require 'rubygems'
require 'htmls_to_pdf'

# Get Pivotal Labs' "Jasmine Wiki" as pdf file
# Source: 'https://github.com/pivotal/jasmine/wiki/'
#

config = {}
config[:urls] = ['https://github.com/pivotal/jasmine/wiki/Background',
                 'https://github.com/pivotal/jasmine/wiki/Suites-and-specs',
                 'https://github.com/pivotal/jasmine/wiki/Matchers',
                 'https://github.com/pivotal/jasmine/wiki/Before-and-After',
                 'https://github.com/pivotal/jasmine/wiki/Spies',
                 'https://github.com/pivotal/jasmine/wiki/Asynchronous-specs',
                 'https://github.com/pivotal/jasmine/wiki/A-simple-project',
                 'https://github.com/pivotal/jasmine/wiki/A-ruby-project-%28with-or-without-rails%29',
                 'https://github.com/pivotal/jasmine/wiki/Spider-monkey',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Spy.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_base.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Block.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Block.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Clock.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_mock-timeout.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Env.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Env.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.JsApiReporter.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_JsApiReporter.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Matchers.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Matchers.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.NestedResults.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_NestedResults.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_PrettyPrinter.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Reporter.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.MultiReporter.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_html_TrivialReporter.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Reporter.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_MultiReporter.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Runner.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Runner.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Queue.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Spec.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Spec.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.Suite.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_Suite.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.util.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_util.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/jasmine.WaitsForBlock.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_WaitsBlock.js.html',
                 'http://pivotal.github.com/jasmine/jsdoc/symbols/src/src_core_WaitsForBlock.js.html']

config[:savedir] = '~/Tech/Javascript/JASMINE'
#config[:css] = ['https://a248.e.akamai.net/assets.github.com/assets/github-d32e243bf8eb8ccb9713860d2989f567c74780f5.css',
#                'https://a248.e.akamai.net/assets.github.com/assets/github2-9618739f589609d8af1547d00def64a14f3f4410.css']
config[:css] = 'div#header{display:none;} ul.tabs{display:none;} div#logo-popup{display:none;} div#footer{display:none;} div#markdown-help{display:none;} div.pagehead{display:none;} ul.wiki-actions{display:none;} div#keyboard_shortcuts_pane{display:none;} div.js-hidden-pane{display:none;} div#ajax-error-message{display:none;}'
config[:savename] = 'Jasmine_wiki.pdf'
config[:remove_css_files] = true
config[:remove_html_files] = false
config[:overwrite_existing_pdf] = true

HtmlsToPdf.new(config).create_pdf
