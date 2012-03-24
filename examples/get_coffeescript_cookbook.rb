require 'rubygems'
require 'htmls_to_pdf'

# Get 'CoffeeScript Cookbook' as pdf file
# Source: 'http://coffeescriptcookbook.com/'

config = {}
config[:urls] = [
       'http://coffeescriptcookbook.com/',
       'http://coffeescriptcookbook.com/chapters/syntax',
       'http://coffeescriptcookbook.com/chapters/syntax/embedding_javascript',
       'http://coffeescriptcookbook.com/chapters/syntax/comparing_ranges',
       'http://coffeescriptcookbook.com/chapters/syntax/for_loops',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects/class-methods-and-instance-methods',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects/cloning',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects/object-literal',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects/type-function',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects/class-variables',
       'http://coffeescriptcookbook.com/chapters/classes_and_objects/chaining',
       'http://coffeescriptcookbook.com/chapters/strings',
       'http://coffeescriptcookbook.com/chapters/strings/repeating',
       'http://coffeescriptcookbook.com/chapters/strings/lowercasing-a-string',
       'http://coffeescriptcookbook.com/chapters/strings/uppercasing-a-string',
       'http://coffeescriptcookbook.com/chapters/strings/finding-substrings',
       'http://coffeescriptcookbook.com/chapters/strings/trimming-whitespace-from-a-string',
       'http://coffeescriptcookbook.com/chapters/strings/capitalizing-words',
       'http://coffeescriptcookbook.com/chapters/strings/splitting-a-string',
       'http://coffeescriptcookbook.com/chapters/strings/interpolation',
       'http://coffeescriptcookbook.com/chapters/strings/matching-strings',
       'http://coffeescriptcookbook.com/chapters/strings/generating-a-unique-id',
       'http://coffeescriptcookbook.com/chapters/arrays',
       'http://coffeescriptcookbook.com/chapters/arrays/creating-a-string-from-an-array',
       'http://coffeescriptcookbook.com/chapters/arrays/zip-function',
       'http://coffeescriptcookbook.com/chapters/arrays/max-array-value',
       'http://coffeescriptcookbook.com/chapters/arrays/using-arrays-to-swap-variables',
       'http://coffeescriptcookbook.com/chapters/arrays/define-ranges',
       'http://coffeescriptcookbook.com/chapters/arrays/shuffling-array-elements',
       'http://coffeescriptcookbook.com/chapters/arrays/mapping-arrays',
       'http://coffeescriptcookbook.com/chapters/arrays/reducing-arrays',
       'http://coffeescriptcookbook.com/chapters/arrays/filtering-arrays',
       'http://coffeescriptcookbook.com/chapters/arrays/reversing-arrays',
       'http://coffeescriptcookbook.com/chapters/arrays/concatenating-arrays',
       'http://coffeescriptcookbook.com/chapters/arrays/testing-every-element',
       'http://coffeescriptcookbook.com/chapters/arrays/list-comprehensions',
       'http://coffeescriptcookbook.com/chapters/arrays/removing-duplicate-elements-from-arrays',
       'http://coffeescriptcookbook.com/chapters/dates_and_times',
       'http://coffeescriptcookbook.com/chapters/dates_and_times/date-of-easter',
       'http://coffeescriptcookbook.com/chapters/dates_and_times/date-of-thanksgiving',
       'http://coffeescriptcookbook.com/chapters/dates_and_times/finding-last-day-of-the-month',
       'http://coffeescriptcookbook.com/chapters/dates_and_times/days-between-two-dates',
       'http://coffeescriptcookbook.com/chapters/dates_and_times/finding-last-or-next-month',
       'http://coffeescriptcookbook.com/chapters/math',
       'http://coffeescriptcookbook.com/chapters/math/fast-fibonacci',
       'http://coffeescriptcookbook.com/chapters/math/random-integer',
       'http://coffeescriptcookbook.com/chapters/math/generating-random-numbers',
       'http://coffeescriptcookbook.com/chapters/math/constants',
       'http://coffeescriptcookbook.com/chapters/math/generating-predictable-random-numbers',
       'http://coffeescriptcookbook.com/chapters/math/fast-inv-square',
       'http://coffeescriptcookbook.com/chapters/math/radians-degrees',
       'http://coffeescriptcookbook.com/chapters/functions',
       'http://coffeescriptcookbook.com/chapters/functions/recursion',
       'http://coffeescriptcookbook.com/chapters/functions/parentheses',
       'http://coffeescriptcookbook.com/chapters/functions/splat_arguments',
       'http://coffeescriptcookbook.com/chapters/metaprogramming',
       'http://coffeescriptcookbook.com/chapters/metaprogramming/detecting-and-replacing-functions',
       'http://coffeescriptcookbook.com/chapters/metaprogramming/extending-built-in-objects',
       'http://coffeescriptcookbook.com/chapters/jquery',
       'http://coffeescriptcookbook.com/chapters/jquery/ajax',
       'http://coffeescriptcookbook.com/chapters/jquery/plugin',
       'http://coffeescriptcookbook.com/chapters/jquery/callback-bindings-jquery',
       'http://coffeescriptcookbook.com/chapters/regular_expressions',
       'http://coffeescriptcookbook.com/chapters/regular_expressions/replacing-substrings',
       'http://coffeescriptcookbook.com/chapters/regular_expressions/replacing-html-tags-with-html-named-entities',
       'http://coffeescriptcookbook.com/chapters/regular_expressions/heregexes',
       'http://coffeescriptcookbook.com/chapters/regular_expressions/searching-for-substrings',
       'http://coffeescriptcookbook.com/chapters/networking',
       'http://coffeescriptcookbook.com/chapters/networking/bi-directional-server',
       'http://coffeescriptcookbook.com/chapters/networking/bi-directional-client',
       'http://coffeescriptcookbook.com/chapters/networking/basic-client',
       'http://coffeescriptcookbook.com/chapters/networking/basic-http-client',
       'http://coffeescriptcookbook.com/chapters/networking/basic-server',
       'http://coffeescriptcookbook.com/chapters/networking/basic-http-server',
       'http://coffeescriptcookbook.com/chapters/design_patterns',
       'http://coffeescriptcookbook.com/chapters/design_patterns/builder',
       'http://coffeescriptcookbook.com/chapters/design_patterns/bridge',
       'http://coffeescriptcookbook.com/chapters/design_patterns/decorator',
       'http://coffeescriptcookbook.com/chapters/design_patterns/interpreter',
       'http://coffeescriptcookbook.com/chapters/design_patterns/command',
       'http://coffeescriptcookbook.com/chapters/design_patterns/factory_method',
       'http://coffeescriptcookbook.com/chapters/design_patterns/strategy',
       'http://coffeescriptcookbook.com/chapters/design_patterns/memento',
       'http://coffeescriptcookbook.com/chapters/design_patterns/singleton',
       'http://coffeescriptcookbook.com/chapters/databases',
       'http://coffeescriptcookbook.com/chapters/databases/mongodb',
       'http://coffeescriptcookbook.com/chapters/databases/sqlite']
config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/DOCUMENTATION'
config[:savename] = 'CoffeeScript_Cookbook.pdf'
config[:css] = ['http://coffeescriptcookbook.com/css/default.css']

HtmlsToPdf.new(config).create_pdf
