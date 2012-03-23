require 'rubygems'
require 'htmls_to_pdf'

# Get 'BashGuide' as a pdf
# Source: 'http://mywiki.wooledge.org/BashGuide'

def bash_guide_urls
  urls = ['http://mywiki.wooledge.org/BashGuide',
          'http://mywiki.wooledge.org/BashGuide/CommandsAndArguments',
          'http://mywiki.wooledge.org/BashGuide/SpecialCharacters',
          'http://mywiki.wooledge.org/BashGuide/Parameters',
          'http://mywiki.wooledge.org/BashGuide/Patterns',
          'http://mywiki.wooledge.org/BashGuide/TestsAndConditionals',
          'http://mywiki.wooledge.org/BashGuide/Arrays',
          'http://mywiki.wooledge.org/BashGuide/InputAndOutput',
          'http://mywiki.wooledge.org/BashGuide/CompoundCommands',
          'http://mywiki.wooledge.org/BashGuide/Sourcing',
          'http://mywiki.wooledge.org/BashGuide/JobControl',
          'http://mywiki.wooledge.org/BashGuide/Practices'
  ]
  urls
end

config = {}
config[:savedir] = '~/Tech/Linux/SHELL SCRIPTING'
config[:savename] = 'WooledgeBashGuide.pdf'
config[:urls] = bash_guide_urls
#config[:css] = ['http://ruby.learncodethehardway.org/book/css/syntax.css']
config[:remove_temp_files] = true

html_files = HtmlsToPdf.new(config).create_pdf
