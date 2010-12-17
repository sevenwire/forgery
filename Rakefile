require 'rake'
require 'rake/rdoctask'
require 'spec/rake/spectask'
require File.expand_path('./lib/forgery/file_writer')

begin
  require 'sdoc_helpers'
rescue LoadError
  puts "sdoc support not enabled. Please gem install sdoc-helpers."
end

desc 'Default: run specs with rcov.'
task :default => :rcov_spec

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Run the specs with rcov'
Spec::Rake::SpecTask.new("rcov_spec") do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--color']
  t.rcov = true
  t.rcov_opts = ['--exclude', '^spec,/gems/']
end

Rake::RDocTask.new do |t|
  t.rdoc_dir = 'doc'
  t.rdoc_files.include('lib/**/*.rb')
  t.options << '--inline-source'
  t.options << '--all'
  t.options << '--line-numbers'
end

desc "Create a dictionary file from web content."
task :create_dictionary, :dictionary_name, :source_url, :css_or_xpath do |t, args|
  dictionary_name = args[:dictionary_name].to_s || raise("parameter :dictionary_name is required")
  source_url = args[:source_url].to_s || raise("parameter :source_url is required")
  css_or_xpath = args[:css_or_xpath].to_s || raise("parameter :css_or_xpath is required")
  
  Forgery::FileWriter.create_dictionary dictionary_name, source_url, css_or_xpath
end
