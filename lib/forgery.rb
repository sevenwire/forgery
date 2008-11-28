# Require forgeries at the bottom of the file so Forgery works as a gem both
# within rails and outside of it.

# Loading forgery helpers.
require File.expand_path(File.dirname(__FILE__) + '/file_reader')
require File.expand_path(File.dirname(__FILE__) + '/dictionaries')
require File.expand_path(File.dirname(__FILE__) + '/formats')

# Loading class extensions
Dir[File.expand_path(File.dirname(__FILE__) + '/extensions/**/*.rb')].uniq.each do |file|
  require file
end

class Forgery

  def self.dictionaries
    @@dictionaries ||= Dictionaries.new
  end

  def self.formats
    @@formats ||= Formats.new
  end

end

# Alternate Forgery api, see spec/forgery_spec.rb for examples.
def Forgery(forgery, method=nil, *args)
  klass = "#{forgery.to_s.camelize}Forgery".constantize
  if method
    klass.send(method, *args)
  else
    klass
  end
end

# Loading the other forgeries AFTER the initial Forgery class is defined.
Dir[File.expand_path(File.dirname(__FILE__) + '/forgeries/**/*.rb')].uniq.each do |file|
  require file
end

# Loading rails forgeries to override current forgery methods and add new
# forgeries
if defined?(RAILS_ROOT)
  Dir[File.expand_path(RAILS_ROOT + '/lib/forgery/**/*.rb')].uniq.each do |file|
    require file
  end
end
