require 'test/unit'
require File.dirname(__FILE__) + '/../lib/forgery'

Dir[File.expand_path(File.dirname(__FILE__) + '/../lib/**/*.rb')].uniq.each do |file|
  require file
end
