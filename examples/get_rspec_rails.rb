require 'rubygems'
require 'htmls_to_pdf'

# Get 'RSpec Rails documentation' as pdf file
# Source: 'https://www.relishapp.com/rspec/rspec-rails/docs'

config = {}
config[:urls] = [
          'https://www.relishapp.com/rspec/rspec-rails/docs',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/gettingstarted',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/generators',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/transactions',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/autotest',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/railsversions',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/request-specs/request-spec',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/model-specs',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/model-specs/errors-on',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/model-specs/transactional-examples',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs/cookies',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs/controller-spec',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs/views-are-stubbed-by-default',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs/render-views',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs/anonymous-controller',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/controller-specs/bypass-rescue',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/helper-specs/helper-spec',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/mailer-specs/url-helpers-in-mailer-examples',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/routing-specs',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/routing-specs/route-to-matcher',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/routing-specs/be-routable-matcher',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/routing-specs/named-routes',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/view-specs/view-spec',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/view-specs/stub-template',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/view-specs/view-spec-infers-controller-path-and-action',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/matchers',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/matchers/be-a-new-matcher',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/matchers/render-template-matcher',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/matchers/redirect-to-matcher',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/matchers/activerecord-relation-match-array',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/mocks/mock-model',
          'https://www.relishapp.com/rspec/rspec-rails/v/2-8/docs/mocks/stub-model'
          ]
config[:savedir] = '~/Tech/Rails/TESTING/RSPEC'
config[:savename] = 'RSpec_Rails_documentation.pdf'
config[:css] = [
                'https://www.relishapp.com/stylesheets/global.css',
                #'https://www.relishapp.com/stylesheets/application.css',
                'https://www.relishapp.com/stylesheets/print.css']
config[:remove_temp_files] = true

HtmlsToPdf.new(config).create_pdf
