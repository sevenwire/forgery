require 'bundler'
require 'rspec/core/rake_task'

task :default => :spec

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new

task :console do
  require 'irb'
  require 'irb/completion'
  require 'forgery'
  ARGV.clear
  IRB.start
end
