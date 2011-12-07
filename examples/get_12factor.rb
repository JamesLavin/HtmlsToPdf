require 'rubygems'
require 'htmls_to_pdf'

# Get '12factor.net' as pdf file
# Source: '12factor.net'

config = {}
config[:urls] = ['http://www.12factor.net',
                 'http://www.12factor.net/codebase',
                 'http://www.12factor.net/dependencies',
                 'http://www.12factor.net/config',
                 'http://www.12factor.net/backing-services',
                 'http://www.12factor.net/build-release-run',
                 'http://www.12factor.net/processes',
                 'http://www.12factor.net/port-binding',
                 'http://www.12factor.net/concurrency',
                 'http://www.12factor.net/disposability',
                 'http://www.12factor.net/dev-prod-parity',
                 'http://www.12factor.net/logs',
                 'http://www.12factor.net/admin-processes'
                ]
config[:savedir] = '~/Tech/Programming'
config[:savename] = 'The_12_Factor_App.pdf'
config[:css] = ['http://www.12factor.net/style.css']

HtmlsToPdf.new(config).create_pdf
