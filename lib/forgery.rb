# Require forgeries at the bottom of the file so Forgery works as a gem both
# within rails and outside of it.

class Forgery
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

  def self.load_extensions
    Dir[gem_path + 'forgery/extensions/**/*.rb'].each do |file|
      require file
    end
  end

  def self.rails?
    !rails_root.nil?
  end

  def self.gem_path
    @@gem_path ||= File.expand_path(File.dirname(__FILE__)) + '/'
  end

end

# Loading forgery helpers.
require 'forgery/tool_resolver'
require 'forgery/file_reader'
require 'forgery/storage'
require 'forgery/tool'
require 'forgery/extend'
require 'forgery/forgery_api'
require 'forgery/version'

# Deprecate Forgery classes using Forgery as base class by virtue
# of calling dictionaries or formats methods on it.
class Forgery
  def self.dictionaries
    warn 'The Forgery base class is deprecated. Use Forgery::Tool as the base class for your forgery classes or tools.'
    Forgery::Tool.dictionaries(*args)
  end

  def self.formats
    warn 'The Forgery base class is deprecated. Use Forgery::Tool as the base class for your forgery classes or tools.'
    Forgery::Tool.formats(*args)
  end
end

Forgery.load_extensions

# Loading the forgery tools
Dir[Forgery.gem_path + 'forgery/tools/**/*.rb'].each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new forgeries
# Only run this for Rails < 3.0 since we need to use a Railtie to initialize >= 3.0
Forgery.load_from! "#{Forgery.rails_root}/lib/forgery" if Forgery.rails? && Rails::VERSION::STRING < "3.0.0"

# Include our Railtie if Rails >= 3.0.0
require 'forgery/railtie' if Forgery.rails? && Rails::VERSION::STRING >= "3.0.0"
