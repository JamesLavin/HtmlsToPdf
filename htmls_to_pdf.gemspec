$:.push File.expand_path("../lib", __FILE__)
require 'htmls_to_pdf/version'

Gem::Specification.new do |s|
  s.name            = 'htmls_to_pdf'
  s.version         = HtmlsToPdf::VERSION
  s.platform        = Gem::Platform::RUBY
  s.authors         = ['James Lavin']
  s.email           = ['htmls_to_pdf@futureresearch.com']
  s.summary         = %q{Creates single PDF file from 1+ HTML pages}
  s.description     = %q{Creates single PDF file from 1+ HTML pages using PDFKit}
  s.add_development_dependency 'rspec'
  s.require_paths   = ['lib']
  s.files           = `git ls-files`.split("\n")
  s.test_files      = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables     = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
end
