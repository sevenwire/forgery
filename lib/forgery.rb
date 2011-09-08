# Require forgeries at the bottom of the file so Forgery works as a gem both
# within rails and outside of it.

current_path = File.expand_path(File.dirname(__FILE__)) + '/'

# Loading forgery helpers.
require 'forgery/file_reader'
require 'forgery/dictionaries'
require 'forgery/formats'

# Loading extensions
require 'forgery/extend'
Dir[current_path + 'forgery/extensions/**/*.rb'].uniq.each do |file|
  require file
end

# Load the forgery base classes
require 'forgery/forgery'

# Load the forgery version
require 'forgery/version'

# Load the forgery api method
require 'forgery/forgery_api'

# Loading the other forgeries AFTER the initial forgery class is defined.
Dir[current_path + 'forgery/forgery/**/*.rb'].uniq.each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new forgeries
# Only run this for Rails < 3.0 since we need to use a Railtie to initialize >= 3.0
Forgery.load_from! "#{Forgery.rails_root}/lib/forgery" if Forgery.rails? && Rails::VERSION::STRING < "3.0.0"
# Include our Railtie if Rails >= 3.0.0
require 'forgery/forgery_railtie' if Forgery.rails? && Rails::VERSION::STRING >= "3.0.0"
