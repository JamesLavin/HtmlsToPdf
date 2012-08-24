require 'webmock/rspec'

require 'fakefs'
# This alternative enables selective inclusion of FakeFS
# with 'include FakeFS::SpecHelpers'
#
# require 'fakefs/spec_helpers'
# RSpec.configure do |config|
#   config.include FakeFS::SpecHelpers
# end

Dir["./spec/support/**/*.rb"].each {|f| require f}
