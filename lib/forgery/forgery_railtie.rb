require 'forgery'
require 'rails'
require 'rake'

class ForgeryRailtie < Rails::Railtie
  extend Rake::DSL
  
  config.to_prepare do
    Forgery.load_from! "#{Rails.root}/lib/forgery"
  end

  rake_tasks do
    namespace :forgery do
      desc %q{
      Create a dictionary file from web content (xml or html).
      Writes to the directory specified by Forgery::FileWriter#write_to!
      '${GEM_HOME}/lib/forgery/dictionaries' by default (standalone)
      '${Rails.root}/lib/forgery/dictionaries' by default (as a Rails 3 plugin)

      Parameters:
      :dictionary_name  -- the name of your new dictionary file
      :source_url       -- web page containing the data for your dictionary file
      :css_or_xpath     -- css or xpath selector(s) to element(s) containing the desired data

      Usage:
      rake forgery:create_dictionary[name_of_file,'http://www.html_or_xml_page.com','li']
      }
      task :create_dictionary, :dictionary_name, :source_url, :css_or_xpath do |t, args|
        dictionary_name = args[:dictionary_name].to_s || raise("parameter :dictionary_name is required")
        source_url = args[:source_url].to_s || raise("parameter :source_url is required")
        css_or_xpath = args[:css_or_xpath].to_s || raise("parameter :css_or_xpath is required")

        Forgery::FileWriter.write_to! "#{Rails.root}/lib/forgery/dictionaries"
        Forgery::FileWriter.create_dictionary dictionary_name, source_url, css_or_xpath
      end
    end
  end
end
