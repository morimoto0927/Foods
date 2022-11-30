# -*- encoding: utf-8 -*-
# stub: puma-daemon 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "puma-daemon".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/kig/puma-daemon/master/CHANAGELOG", "homepage_uri" => "https://github.com/kig/puma-daemon", "source_code_uri" => "https://github.com/kig/puma-daemon" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Konstantin Gredeskoul".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-03-05"
  s.description = "\nIn version 5.0 the authors of the popular Ruby web server Puma chose\nto remove the daemonization support from Puma, because the code wasn't wall maintained, \nand because other and perhaps better options exist (such as systemd, etc), not to \nmention many people have switched to Kubernetes and Docker, where you want to start \nall servers on the foreground.\n\nAnd yet, something useful and simple got lost \u2014 in our humble opinion. Some folks were \nindeed happily using the `--daemonize` feature until in 5.0 they got an error that this flag is \nnot supported.\n\nSo, if you want to use the latest and greatest Puma 5+, but have it self-daemonize, \nthis gem is for you. Just use *pumad* binary instead of *puma*, or require 'puma/daemon' inside\nyour config file.\n".freeze
  s.email = ["kigster@gmail.com".freeze]
  s.executables = ["pumad".freeze]
  s.files = ["exe/pumad".freeze]
  s.homepage = "https://github.com/kig/puma-daemon".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Restore somewhat Puma's ability to self-daemonize, since Puma 5.0 dropped it".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<puma>.freeze, [">= 5.0"])
    s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
    s.add_development_dependency(%q<asciidoctor>.freeze, [">= 0"])
    s.add_development_dependency(%q<codecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<relaxed-rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  else
    s.add_dependency(%q<puma>.freeze, [">= 5.0"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<asciidoctor>.freeze, [">= 0"])
    s.add_dependency(%q<codecov>.freeze, [">= 0"])
    s.add_dependency(%q<relaxed-rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
  end
end
