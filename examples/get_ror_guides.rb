require 'rubygems'
require 'htmls_to_pdf'

# Get all 'Ruby on Rails Guides' as a single pdf file
# Source: 'http://guides.rubyonrails.org/index.html'

config = {}
config[:urls] = [
          'http://guides.rubyonrails.org/index.html',
          'http://guides.rubyonrails.org/getting_started.html',
          'http://guides.rubyonrails.org/migrations.html',
          'http://guides.rubyonrails.org/active_record_validations_callbacks.html',
          'http://guides.rubyonrails.org/association_basics.html',
          'http://guides.rubyonrails.org/active_record_querying.html',
          'http://guides.rubyonrails.org/layouts_and_rendering.html',
          'http://guides.rubyonrails.org/form_helpers.html',
          'http://guides.rubyonrails.org/action_controller_overview.html',
          'http://guides.rubyonrails.org/routing.html',
          'http://guides.rubyonrails.org/active_support_core_extensions.html',
          'http://guides.rubyonrails.org/i18n.html',
          'http://guides.rubyonrails.org/action_mailer_basics.html',
          'http://guides.rubyonrails.org/testing.html',
          'http://guides.rubyonrails.org/security.html',
          'http://guides.rubyonrails.org/debugging_rails_applications.html',
          'http://guides.rubyonrails.org/performance_testing.html',
          'http://guides.rubyonrails.org/configuring.html',
          'http://guides.rubyonrails.org/command_line.html',
          'http://guides.rubyonrails.org/caching_with_rails.html',
          'http://guides.rubyonrails.org/asset_pipeline.html',
          'http://guides.rubyonrails.org/initialization.html',
          'http://guides.rubyonrails.org/plugins.html',
          'http://guides.rubyonrails.org/rails_on_rack.html',
          'http://guides.rubyonrails.org/generators.html',
          'http://guides.rubyonrails.org/contributing_to_ruby_on_rails.html',
          'http://guides.rubyonrails.org/api_documentation_guidelines.html',
          'http://guides.rubyonrails.org/ruby_on_rails_guides_guidelines.html',
          'http://guides.rubyonrails.org/3_2_release_notes.html',
          'http://guides.rubyonrails.org/3_1_release_notes.htmlhttp://guides.rubyonrails.org/3_0_release_notes.html',
          'http://guides.rubyonrails.org/2_3_release_notes.html',
          'http://guides.rubyonrails.org/2_2_release_notes.html'
          ]
config[:savedir] = '~/Tech/Rails/RAILS_GUIDES'
config[:savename] = 'Ruby_on_Rails_Guides.pdf'
config[:css] = [
                'http://guides.rubyonrails.org/stylesheets/print.css']
config[:remove_temp_files] = true

HtmlsToPdf.new(config).create_pdf
