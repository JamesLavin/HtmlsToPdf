require 'rubygems'
require 'htmls_to_pdf'

# Get 'Jumpstart Labs Advanced Rails' as pdf file
# Source: 'http://tutorials.jumpstartlab.com/paths/advanced_rails_five_day.html'

config = {}
config[:urls] = [
          'http://tutorials.jumpstartlab.com/paths/advanced_rails_five_day.html',
          'http://tutorials.jumpstartlab.com/topics/environment/environment.html',
          'http://tutorials.jumpstartlab.com/topics/environment/rvm.html',
          'http://tutorials.jumpstartlab.com/topics/environment/bundler.html',
          'http://tutorials.jumpstartlab.com/topics/environment/git_strategy.html',
          'http://tutorials.jumpstartlab.com/topics/environment/heroku.html',
          'http://tutorials.jumpstartlab.com/topics/routes/request_cycle.html',
          'http://tutorials.jumpstartlab.com/topics/routes/router.html',
          'http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_and_bdd.html',
          'http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_practices.html',
          'http://tutorials.jumpstartlab.com/topics/internal_testing/factories.html',
          'http://tutorials.jumpstartlab.com/topics/internal_testing/code_coverage.html',
          'http://tutorials.jumpstartlab.com/topics/capybara/capybara_with_rack_test.html',
          'http://tutorials.jumpstartlab.com/topics/capybara/capybara_with_selenium_and_webkit.html',
          'http://tutorials.jumpstartlab.com/topics/capybara/capybara_practice.html',
          'http://tutorials.jumpstartlab.com/topics/debugging/outputting_text.html',
          'http://tutorials.jumpstartlab.com/topics/debugging/debugger.html',
          'http://tutorials.jumpstartlab.com/topics/debugging/error_services.html',
          'http://tutorials.jumpstartlab.com/topics/models/relationships.html',
          'http://tutorials.jumpstartlab.com/topics/models/polymorphism.html',
          'http://tutorials.jumpstartlab.com/topics/models/legacy_databases.html',
          'http://tutorials.jumpstartlab.com/topics/models/validations.html',
          'http://tutorials.jumpstartlab.com/topics/models/transactions.html',
          'http://tutorials.jumpstartlab.com/topics/models/processor_models.html',
          'http://tutorials.jumpstartlab.com/topics/models/modules.html',
          'http://tutorials.jumpstartlab.com/topics/controllers/parameters.html',
          'http://tutorials.jumpstartlab.com/topics/controllers/filters.html',
          'http://tutorials.jumpstartlab.com/topics/controllers/friendly-urls.html',
          'http://tutorials.jumpstartlab.com/topics/controllers/flash.html',
          'http://tutorials.jumpstartlab.com/topics/controllers/render_and_redirect.html',
          'http://tutorials.jumpstartlab.com/topics/controllers/sessions_and_conversations.html',
          'http://tutorials.jumpstartlab.com/topics/better_views/understanding_views.html',
          'http://tutorials.jumpstartlab.com/topics/better_views/erb_and_haml.html',
          'http://tutorials.jumpstartlab.com/topics/better_views/view_partials.html',
          'http://tutorials.jumpstartlab.com/topics/better_views/pagination.html',
          'http://tutorials.jumpstartlab.com/topics/javascript/rails_and_javascript.html',
          'http://tutorials.jumpstartlab.com/topics/javascript/jquery.html',
          'http://tutorials.jumpstartlab.com/topics/javascript/coffeescript.html',
          'http://tutorials.jumpstartlab.com/topics/web_services/api.html',
          'http://tutorials.jumpstartlab.com/topics/web_services/encoding_and_filtering.html',
          'http://tutorials.jumpstartlab.com/topics/web_services/active_resource.html',
          'http://tutorials.jumpstartlab.com/topics/web_services/soap.html',
          'http://tutorials.jumpstartlab.com/topics/performance/measuring.html',
          'http://tutorials.jumpstartlab.com/topics/performance/queries.html',
          'http://tutorials.jumpstartlab.com/topics/performance/caching.html',
          'http://tutorials.jumpstartlab.com/topics/performance/background_jobs.html',
          'http://tutorials.jumpstartlab.com/topics/systems/credentials_and_configuration.html',
          'http://tutorials.jumpstartlab.com/topics/systems/automation.html',
          'http://tutorials.jumpstartlab.com/topics/auth/local_authentication.html',
          'http://tutorials.jumpstartlab.com/topics/auth/remote_authentication.html',
          'http://tutorials.jumpstartlab.com/topics/auth/authorization.html',
          'http://tutorials.jumpstartlab.com/topics/search.html',
          'http://tutorials.jumpstartlab.com/topics/heroku.html',
          'http://tutorials.jumpstartlab.com/topics/continuous_integration.html',
          'http://tutorials.jumpstartlab.com/topics/sample_project.html'
          ]
config[:savedir] = '~/Tech/Rails/BOOKS'
config[:savename] = 'JumpstartLabs_Advanced_Rails.pdf'
config[:css] = ['http://tutorials.jumpstartlab.com/stylesheets/screen.css']
config[:remove_temp_files] = true

HtmlsToPdf.new(config).create_pdf
