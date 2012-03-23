require 'rubygems'
require 'htmls_to_pdf'

# Get 'RSpec documentation' as pdf file
# Source: 'https://www.relishapp.com/rspec'

config = {}
config[:urls] = [
          'https://www.relishapp.com/rspec/rspec-core/docs',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/autotest',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/example-groups',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/example-groups/basic-structure-describe-it',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/example-groups/shared-examples',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/example-groups/shared-context',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/example-option',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/format-option',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/line-number-option',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/tag-option',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/line-number-appended-to-file-path',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/exit-status',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/rake-task',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/init-option',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/order-new-in-rspec-core-2-8',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/pattern-option',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/command-line/run-with-ruby-command',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/pending/pending-examples',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/hooks/before-and-after-hooks',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/hooks/around-hooks',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/hooks/filters',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/subject/implicitly-defined-subject',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/subject/explicit-subject',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/subject/attribute-of-subject',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/subject/implicit-receiver',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/helper-methods/let-and-let',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/helper-methods/arbitrary-helper-methods',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/helper-methods/define-helper-methods-in-a-module',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/metadata/current-example',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/metadata/described-class',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/metadata/user-defined-metadata',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/filtering/inclusion-filters',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/filtering/exclusion-filters',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/filtering/if-and-unless',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/filtering/run-all-when-everything-filtered',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/configuration/read-command-line-configuration-options-from-files',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/configuration/fail-fast',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/configuration/custom-settings',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/configuration/alias-example-to',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/configuration/default-path',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/expectation-framework-integration/configure-expectation-framework',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/mock-framework-integration/mock-with-rspec',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/mock-framework-integration/mock-with-flexmock',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/mock-framework-integration/mock-with-mocha',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/mock-framework-integration/mock-with-rr',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/mock-framework-integration/mock-with-an-alternative-framework',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/formatters/custom-formatters',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/formatters/text-formatter',
          'https://www.relishapp.com/rspec/rspec-core/v/2-8/docs/spec-files/arbitrary-file-suffix',
          'https://www.relishapp.com/rspec/rspec-expectations/docs',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/customized-message',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/diffing',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/implicit-docstrings',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/be-matchers',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/be-within-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/equality-matchers',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/exist-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/expect-change',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/raise-error-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/have-n-items-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/include-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/match-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/operator-matchers',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/predicate-matchers',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/respond-to-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/satisfy-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/throw-symbol-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/specify-types-of-objects',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/cover-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/custom-matchers',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/custom-matchers/define-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/custom-matchers/define-diffable-matcher',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/custom-matchers/define-matcher-with-fluent-interface',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/custom-matchers/access-running-example',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/custom-matchers/define-matcher-outside-rspec',
          'https://www.relishapp.com/rspec/rspec-expectations/v/2-8/docs/test-frameworks/test-unit-integration',
          'https://www.relishapp.com/rspec/rspec-mocks/docs',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs/stub-with-a-simple-return-value',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs/stub-with-substitute-implementation',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs/stub-a-chain-of-methods',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs/stub-on-any-instance-of-a-class',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs/as-null-object',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/method-stubs/double-handling-to-ary',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/message-expectations',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/message-expectations/expect-a-message',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/message-expectations/expect-a-message-on-any-instance-of-a-class',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/message-expectations/warn-when-expectation-is-set-on-nil',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/message-expectations/receive-counts',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/argument-matchers',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/argument-matchers/explicit-arguments',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/argument-matchers/general-matchers',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/argument-matchers/stub-with-argument-constraints',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/outside-rspec/configure-any-test-framework-to-use-rspec-mocks',
          'https://www.relishapp.com/rspec/rspec-mocks/v/2-8/docs/outside-rspec/standalone'
          ]
config[:savedir] = '~/Tech/Ruby/TESTING/RSPEC'
config[:savename] = 'RSpec_documentation.pdf'
config[:css] = [
                'https://www.relishapp.com/stylesheets/global.css',
                #'https://www.relishapp.com/stylesheets/application.css',
                'https://www.relishapp.com/stylesheets/print.css']
config[:remove_temp_files] = true

HtmlsToPdf.new(config).create_pdf
