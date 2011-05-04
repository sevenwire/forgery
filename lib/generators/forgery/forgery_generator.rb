require 'rails/generators/base'

class ForgeryGenerator < Rails::Generators::Base
  desc "Create the necessary directories in /lib to customize forgery's behavior"

  def self.source_root
    @_forgery_source_root ||= File.expand_path(File.dirname(__FILE__))
  end

  def create_directories
    puts "Creating directories in /lib/forgery..."

    FileUtils.mkdir_p 'lib/forgery/dictionaries'
    FileUtils.mkdir_p 'lib/forgery/extensions'
    FileUtils.mkdir_p 'lib/forgery/forgeries'
    FileUtils.mkdir_p 'lib/forgery/formats'
  end
end
