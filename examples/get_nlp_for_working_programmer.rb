require 'rubygems'
require 'htmls_to_pdf'

# Get 'Natural Language Processing for the Working Programmer' as pdf file
# Source: 'http://nlpwp.org/book/'

config = {}
config[:urls] = ['http://nlpwp.org/book/',
                 'http://nlpwp.org/book/preface.xhtml',
                 'http://nlpwp.org/book/chap-words.xhtml',
                 'http://nlpwp.org/book/chap-ngrams.xhtml',
                 'http://nlpwp.org/book/chap-similarity.xhtml',
                 'http://nlpwp.org/book/chap-classification.xhtml',
                 'http://nlpwp.org/book/chap-ir.xhtml',
                 'http://nlpwp.org/book/chap-tagging.xhtml',
                 'http://nlpwp.org/book/chap-reglang.xhtml',
                 'http://nlpwp.org/book/chap-cfg.xhtml',
                 'http://nlpwp.org/book/chap-performance.xhtml'
                 ]
config[:savedir] = '~/Tech/Natural Language Processing/NLP_for_Working_Programmers'
config[:savename] = 'Natural_Language_Processing_for_Working_Programmers.pdf'
config[:css] = ['http://nlpwp.org/book/screen.css']

HtmlsToPdf.new(config).create_pdf
