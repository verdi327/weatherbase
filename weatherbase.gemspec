# -*- encoding: utf-8 -*-
require File.expand_path('../lib/weatherbase/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["michael verdi"]
  gem.email         = ["michael.v.verdi@gmail.com"]
  gem.description   = %q{Web scraper for the weatherbase site}
  gem.summary       = %q{Web scraper for the weatherbase site}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weatherbase"
  gem.require_paths = ["lib"]
  gem.version       = Weatherbase::VERSION

  gem.add_runtime_dependency('nokogiri')
  gem.add_runtime_dependency('mechanize')
  gem.add_development_dependency('rspec')
end
