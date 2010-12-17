require 'forgery'
require 'rails'
require 'file_writer'

class ForgeryRailtie < Rails::Railtie
  initializer "forgery_railtie.initialize" do
    Forgery.load_from! "#{Rails.root}/lib/forgery"
    Forgery.write_to! "#{Rails.root}/lib/forgery/dictionaries"
  end

  rake_tasks do
    namespace :forgery do
      task :create_dictionary, :dictionary_name, :source_url, :css_or_xpath do |t, args|
        dictionary_name = args[:dictionary_name].to_s || raise("parameter :dictionary_name is required")
        source_url = args[:source_url].to_s || raise("parameter :source_url is required")
        css_or_xpath = args[:css_or_xpath].to_s || raise("parameter :css_or_xpath is required")

        Forgery::FileWriter.create_dictionary dictionary_name, source_url, css_or_xpath
      end
    end
  end
end
