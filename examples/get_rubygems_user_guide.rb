require 'rubygems'
require 'htmls_to_pdf'

# Get 'RubyGems User Guide' as pdf file
# Source: 'http://docs.rubygems.org/read/book/1'

urls = ['http://docs.rubygems.org/read/book/1']
# I have no idea why these chapters are numbered as they are!
[1,2,3,4,16,7,5,6,21].each do |val|
  urls << 'http://docs.rubygems.org/read/chapter/' + val.to_s
end

savedir = '~/Tech/Ruby/GEMS/DOCUMENTATION'
savename = 'RubyGems_User_Guide.pdf'
#css = []
html_files = HtmlsToPdf.new(savedir,savename,urls)
html_files.create_pdf
