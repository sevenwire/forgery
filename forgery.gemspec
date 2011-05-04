# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'forgery/version'

Gem::Specification.new do |s|
  s.name        = "forgery"
  s.version     = Forgery::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nathan Sutton", "Brandon Arbini"]
  s.email       = ["nate@zencoder.com", "brandon@zencoder.com"]
  s.homepage    = "http://github.com/sevenwire/forgery"
  s.summary     = "Easy and customizable generation of forged data."
  s.description = "Easy and customizable generation of forged data. Can be used as a gem or a rails plugin. Includes rails generators for creating your own forgeries."
  s.rubyforge_project = "forgery"
  s.add_dependency "nokogiri", "~>1.4"
  s.add_development_dependency "rspec"
  s.files        = Dir.glob("{generators,lib}/**/*") + %w(LICENSE README.markdown Rakefile)
  s.require_path = 'lib'
end
