require File.dirname(__FILE__) + '/lib/forgery'

Dir[File.expand_path(File.dirname(__FILE__) + '/lib/**/*.rb')].uniq.each do |file|
  require file
end

if defined?(RAILS_ROOT)
  Dir[File.expand_path(RAILS_ROOT + '/lib/forgery/**/*.rb')].uniq.each do |file|
    require file
  end
end