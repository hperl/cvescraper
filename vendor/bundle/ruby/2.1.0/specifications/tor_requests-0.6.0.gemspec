# -*- encoding: utf-8 -*-
# stub: tor_requests 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tor_requests"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bruno Ghisi"]
  s.date = "2014-04-07"
  s.description = "Create anonymously requests through Tor network"
  s.email = "brunogh@gmail.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/brunogh/tor_requests"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Create anonymously requests through Tor network"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3.5"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<socksify>, [">= 0"])
      s.add_runtime_dependency(%q<socksify>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.11.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.3.5"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<socksify>, [">= 0"])
      s.add_dependency(%q<socksify>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.11.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.3.5"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<socksify>, [">= 0"])
    s.add_dependency(%q<socksify>, [">= 0"])
  end
end
