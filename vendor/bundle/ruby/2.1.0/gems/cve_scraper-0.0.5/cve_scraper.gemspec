# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/cve_scraper/version'

Gem::Specification.new do |gem|
  gem.name          = "cve_scraper"
  gem.version       = CveScraper::VERSION
  gem.authors       = ["Abdullah Ali"]
  gem.email         = ["abdullah-ali@hotmail.co.uk"]
  gem.description   = %q{Scrape CVE details}
  gem.summary       = %q{Scrape CVE details easily}
  gem.homepage      = "https://github.com/AbdullahAli/cve_scraper"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "redis", ["~> 3.0.6"]
  gem.add_runtime_dependency "hpricot", ["~> 0.8.6"]
  gem.add_runtime_dependency "rubyXL", ["~> 1.2.10"]
  gem.add_runtime_dependency "rubyzip", ["~> 1.1.0"]
end
