module Forgery
  def self.[](forgery)
    tools.find(forgery)
  end

  def self.tools
    @@tools ||= ToolResolver.new
  end

  def self.load_paths
    @@load_paths ||= [ File.join(gem_path, 'forgery') ]
  end

  def self.load_from!(path)
    self.load_paths << File.expand_path(path)
    Dir["#{load_paths.last}/**/*.rb"].each { |file| require file }
  end

  def self.rails_root
    if defined?(Rails) && Rails.respond_to?(:root)
      Rails.root.to_s
    elsif defined?(RAILS_ROOT)
      RAILS_ROOT
    end
  end

  def self.rails?
    !rails_root.nil?
  end

  def self.gem_path
    @@gem_path ||= File.expand_path(File.dirname(__FILE__)) + '/'
  end

  # Deprecate Forgery classes using Forgery as base class by virtue
  # of calling dictionaries or formats methods on it.
  def self.dictionaries
    warn 'The Forgery base class is deprecated. Use Forgery::Tool as the base class for your forgery classes or tools.'
    Forgery::Tool.dictionaries
  end

  def self.formats
    warn 'The Forgery base class is deprecated. Use Forgery::Tool as the base class for your forgery classes or tools.'
    Forgery::Tool.formats
  end
end

require 'forgery/version'
require 'forgery/tool_resolver'
require 'forgery/file_reader'
require 'forgery/storage'
require 'forgery/tool'
require 'forgery/extend'
require 'forgery/forgery_api'
require 'forgery/extensions/array'
require 'forgery/extensions/range'
require 'forgery/extensions/string'

Dir[Forgery.gem_path + 'forgery/tools/**/*.rb'].each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new forgeries
if Forgery.rails?
  if Rails::VERSION::STRING >= "3.0.0"
    require 'forgery/railtie'
  else
    Forgery.load_from! "#{Forgery.rails_root}/lib/forgery"
  end
end