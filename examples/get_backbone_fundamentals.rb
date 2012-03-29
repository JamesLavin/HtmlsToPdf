require 'rubygems'
require 'htmls_to_pdf'

# Get "addyosmani's Developing Backbone.js Applications" as pdf file
# Source: 'https://github.com/addyosmani/backbone-fundamentals/blob/master/book.md'
#
# I used only the first Github stylesheet and added the following
# at the bottom:
#
# header, .header, #header, #userbox, .title-actions-bar, .subnav, .meta, .scope, .repostats, .breadcrumb, .file-history-tease, ul.tabs, .topsearch, #footer, #footer-push {
#   display: none;
# }

config = {}
config[:urls] = ['https://github.com/addyosmani/backbone-fundamentals/blob/master/book.md']

config[:savedir] = '~/Tech/Javascript/BACKBONE.JS'
config[:css] = ['https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github-e2fb92c4dcb5e5b1ce2ffd0e84d6bf80937d9197.css'] #,
                 #'https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github2-98a6177ed18ac7b415e311fdb34652f17ad0038c.css']
config[:savename] = 'Developing_Backbone.js_Applications.pdf'
config[:remove_css_files] = false
config[:overwrite_existing_pdf] = true

HtmlsToPdf.new(config).create_pdf
