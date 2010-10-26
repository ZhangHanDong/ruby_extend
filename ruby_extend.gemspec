# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "ruby_extend"
  s.version     = "0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["blackanger"]
  s.email       = ["blackanger.z@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/ruby_extend"
  s.summary     = "TODO: Write a gem summary"
  s.description = "Ruby Extendsions"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "ruby_extend"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
