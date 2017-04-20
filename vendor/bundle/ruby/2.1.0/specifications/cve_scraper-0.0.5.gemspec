# -*- encoding: utf-8 -*-
# stub: cve_scraper 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "cve_scraper"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Abdullah Ali"]
  s.date = "2013-12-24"
  s.description = "Scrape CVE details"
  s.email = ["abdullah-ali@hotmail.co.uk"]
  s.homepage = "https://github.com/AbdullahAli/cve_scraper"
  s.rubygems_version = "2.2.2"
  s.summary = "Scrape CVE details easily"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, ["~> 3.0.6"])
      s.add_runtime_dependency(%q<hpricot>, ["~> 0.8.6"])
      s.add_runtime_dependency(%q<rubyXL>, ["~> 1.2.10"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.1.0"])
    else
      s.add_dependency(%q<redis>, ["~> 3.0.6"])
      s.add_dependency(%q<hpricot>, ["~> 0.8.6"])
      s.add_dependency(%q<rubyXL>, ["~> 1.2.10"])
      s.add_dependency(%q<rubyzip>, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<redis>, ["~> 3.0.6"])
    s.add_dependency(%q<hpricot>, ["~> 0.8.6"])
    s.add_dependency(%q<rubyXL>, ["~> 1.2.10"])
    s.add_dependency(%q<rubyzip>, ["~> 1.1.0"])
  end
end
