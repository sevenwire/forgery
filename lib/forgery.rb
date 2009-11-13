# Require forgeries at the bottom of the file so Forgery works as a gem both
# within rails and outside of it.

current_path = File.expand_path(File.dirname(__FILE__))

# Loading forgery helpers.
require current_path + '/forgery/file_reader'
require current_path + '/forgery/dictionaries'
require current_path + '/forgery/formats'

# Loading class extensions
Dir[current_path + '/forgery/extensions/**/*.rb'].uniq.each do |file|
  require file
end

# Load the forgery base class
require current_path + '/forgery/forgery'

# Load the forgery api method
require current_path + '/forgery/forgery_api'

# Loading the other forgeries AFTER the initial forgery class is defined.
Dir[current_path + '/forgery/forgery/**/*.rb'].uniq.each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new
# forgeries
if Forgery.rails?
  Dir[File.expand_path(Forgery.rails_root + '/lib/forgery/**/*.rb')].uniq.each do |file|
    require file
  end
end
