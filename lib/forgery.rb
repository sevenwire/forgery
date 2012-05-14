# Require forgeries at the bottom of the file so Forgery works as a gem both
# within rails and outside of it.

class Forgery

  def self.dictionaries
    @@dictionaries ||= Dictionaries.new
  end

  def self.[](forgery)
    @@forgery_class ||= Hash.new { |hash, key|
      hash[key] = Forgery::Extend("Forgery::#{Forgery::Extend(key.to_s).camelize}").constantize
    }
    @@forgery_class[forgery]
  end

  def self.formats
    @@formats ||= Formats.new
  end

  def self.load_paths
    @@load_paths ||= [ File.join(forgery_path, 'forgery') ]
  end

  def self.load_from!(path)
    self.load_paths << File.expand_path(path)
    Dir["#{load_paths.last}/**/*.rb"].uniq.each { |file| require file }
  end

  def self.rails_root
    if defined?(Rails) && Rails.respond_to?(:root)
      Rails.root.to_s
    elsif defined?(RAILS_ROOT)
      RAILS_ROOT
    end
  end

  def self.load_extensions
    Dir[forgery_path + 'forgery/extensions/**/*.rb'].uniq.each do |file|
      require file
    end
  end

  def self.rails?
    !rails_root.nil?
  end

  def self.forgery_path
    @@forgery_path ||= File.expand_path(File.dirname(__FILE__)) + '/'
  end

end

# Loading forgery helpers.
require 'forgery/file_reader'
require 'forgery/dictionaries'
require 'forgery/formats'
require 'forgery/version'

# Loading extensions
require 'forgery/extend'
Forgery.load_extensions

# Load the forgery api method
require 'forgery/forgery_api'

# Loading the other forgeries AFTER the initial forgery class is defined.
Dir[Forgery.forgery_path + 'forgery/forgery/**/*.rb'].uniq.each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new forgeries
# Only run this for Rails < 3.0 since we need to use a Railtie to initialize >= 3.0
Forgery.load_from! "#{Forgery.rails_root}/lib/forgery" if Forgery.rails? && Rails::VERSION::STRING < "3.0.0"

# Include our Railtie if Rails >= 3.0.0
require 'forgery/railtie' if Forgery.rails? && Rails::VERSION::STRING >= "3.0.0"
