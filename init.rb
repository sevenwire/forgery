require File.dirname(__FILE__) + '/lib/forgery'

if defined?(RAILS_ROOT)
  Dir[File.expand_path(RAILS_ROOT + '/lib/forgery/**/*.rb')].uniq.each do |file|
    require file
  end
end