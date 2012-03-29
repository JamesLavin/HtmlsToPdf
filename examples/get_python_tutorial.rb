require 'rubygems'
require 'htmls_to_pdf'

# Get 'The Python Tutorial' as a single pdf file
# Source: 'http://docs.python.org/tutorial/index.html'

# To cut out unwanted cruft, I modified default.css.
# I added:
#
# div.sphinxsidebar {
#   display: none;
# }
# 
# div.related {
#   display: none;
# }
# 
# div.footer {
#   display: none;
# }
#
# div.bodywrapper {
#    margin: 0;
# }
#
# And I commented out:
#
# div.bodywrapper {
#   /* margin: 0 0 0 230px; */
# }

config = {}
config[:urls] = [
          'http://docs.python.org/tutorial/index.html',
          'http://docs.python.org/tutorial/appetite.html',
          'http://docs.python.org/tutorial/interpreter.html',
          'http://docs.python.org/tutorial/introduction.html',
          'http://docs.python.org/tutorial/controlflow.html',
          'http://docs.python.org/tutorial/datastructures.html',
          'http://docs.python.org/tutorial/modules.html',
          'http://docs.python.org/tutorial/inputoutput.html',
          'http://docs.python.org/tutorial/errors.html',
          'http://docs.python.org/tutorial/classes.html',
          'http://docs.python.org/tutorial/stdlib.html',
          'http://docs.python.org/tutorial/stdlib2.html',
          'http://docs.python.org/tutorial/whatnow.html',
          'http://docs.python.org/tutorial/interactive.html',
          'http://docs.python.org/tutorial/floatingpoint.html',
          'http://docs.python.org/glossary.html'
          ]
config[:savedir] = '~/Tech/Python/Python_Tutorial'
config[:savename] = 'The_Python_Tutorial.pdf'
config[:css] = ['http://docs.python.org/_static/default.css', 'http://docs.python.org/_static/pygments.css']
config[:remove_css_files] = false

HtmlsToPdf.new(config).create_pdf
