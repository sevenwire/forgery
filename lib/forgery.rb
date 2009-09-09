# Require forgeries at the bottom of the file so Forgery works as a gem both
# within rails and outside of it.

# Loading forgery helpers.
require File.expand_path(File.dirname(__FILE__) + '/forgery/file_reader')
require File.expand_path(File.dirname(__FILE__) + '/forgery/dictionaries')
require File.expand_path(File.dirname(__FILE__) + '/forgery/formats')

# Loading class extensions
Dir[File.expand_path(File.dirname(__FILE__) + '/forgery/extensions/**/*.rb')].uniq.each do |file|
  require file
end

# Load the forgery base class
require File.expand_path(File.dirname(__FILE__) + '/forgery/forgery')

# Load the forgery api method
require File.expand_path(File.dirname(__FILE__) + '/forgery/forgery_api')

# Loading the other forgeries AFTER the initial forgery class is defined.
Dir[File.expand_path(File.dirname(__FILE__) + '/forgery/forgeries/**/*.rb')].uniq.each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new
# forgeries
if defined?(RAILS_ROOT)
  Dir[File.expand_path(RAILS_ROOT + '/lib/forgery/**/*.rb')].uniq.each do |file|
    require file
  end
end
