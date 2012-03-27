require 'rubygems'
require 'htmls_to_pdf'

# Get all 'Practicing Ruby Volume 2' as a single pdf file
# Source: 'http://community.mendicantuniversity.org/articles/practicing-ruby-volume-2-now-freely-avai'

# Note: Author Gregory Brown generously provides these files for free
# but encourages those who can to support his work. He writes:
# "Practicing Ruby is a subscriber-supported service, and 
# is literally how I pay my bills. If you like these 
# articles and want to help make sure I can keep writing
# more of them, please become a subscriber. There is lots
# of content available to members that has not been publicly
# released yet, and I'm adding more articles regularly.
# PS: Anyone who can't pay the full $8/month fee for ANY
# reason is welcome to contact gregory.t.brown@gmail.com
# for a free account."

config = {}
config[:urls] = [
          'http://practicingruby.com/articles/shared/tmxmprhfrpwq',
          'http://practicingruby.com/articles/shared/bhftubljbomqpmifbibmzmptlxhoin',
          'http://practicingruby.com/articles/shared/mvzhovpjbghr',
          'http://practicingruby.com/articles/shared/ggcwduoyfqmz',
          'http://practicingruby.com/articles/shared/afshdqdholth',
          'http://practicingruby.com/articles/shared/vbmlgkdtahzd',
          'http://practicingruby.com/articles/shared/ozkzbsdmagcm',
          'http://practicingruby.com/articles/shared/jleygxejeopq',
          'http://practicingruby.com/articles/shared/qyxvmrgmhuln',
          'http://practicingruby.com/articles/shared/nlhxgszkgenq',
          'http://practicingruby.com/articles/shared/iptocucwujtj',
          'http://practicingruby.com/articles/shared/oelhlibhtlkx',
          'http://practicingruby.com/articles/shared/gthgvfebjvyn',
          'http://practicingruby.com/articles/shared/vpxpovppchww',
          'http://practicingruby.com/articles/shared/wdykkrmdfjvf'
          ]
config[:savedir] = '~/Tech/Ruby/DOCUMENTATION'
config[:savename] = 'Practicing_Ruby_Vol_2.pdf'
config[:css] = ['http://practicingruby.com/assets/application-4fd26c9107c02ce07a20eb2d35d08230.css']
config[:remove_temp_files] = true

HtmlsToPdf.new(config).create_pdf
