# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "ruby_extendsions"
  s.version     = "0.1.8.3"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["blackanger"]
  s.email       = ["blackanger.z@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/ruby_extendsions"
  s.summary     = "Ruby Extendsions For Hash"
  s.description = "Ruby Extendsions for rails 3.0.5+"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "ruby_extendsions"
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
