# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'forgery/version'

Gem::Specification.new do |spec|
  spec.name        = 'forgery'
  spec.version     = Forgery::VERSION
  spec.authors     = ['Nathan Sutton', 'Brandon Arbini', 'Kamil Kieliszczyk']
  spec.email       = ['nate@zencoder.com', 'brandon@zencoder.com', 'kamil@kieliszczyk.net']
  spec.homepage    = 'http://github.com/sevenwire/forgery'
  spec.summary     = 'Easy and customizable generation of forged data.'
  spec.description = 'Easy and customizable generation of forged data. Can be used as a gem or a rails plugin. Includes rails generators for creating your own forgeries.'

  spec.platform = Gem::Platform::RUBY
  spec.required_rubygems_version = '>= 1.3.6'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = `git ls-files spec`.split($INPUT_RECORD_SEPARATOR)
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler', '~> 2.1.4'
end
