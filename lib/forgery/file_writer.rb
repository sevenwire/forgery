require 'rubygems'
require 'nokogiri'
require 'open-uri'
class Forgery

  class FileWriter

    # Creates a dictionary file with data from a web page
    def self.create_dictionary(dictionary_name, source_url, *css_or_xpath)
      doc = open_page(source_url)
      lines = []
      doc.search(*css_or_xpath).each do |node|
        lines << node.content
      end
      raise empty_msg if lines.empty?
      create_file(dictionary_name, lines)
    end

    # Path to which new dictionaries will be written 
    # '${GEM_HOME}/lib/forgery/dictionaries' by default
    def self.write_path
      @@write_path
    end

    # Sets path to which new dictionaries will be written
    def self.write_to!(path)
      @@write_path = File.expand_path path
    end

    private
    # Creates file with a line for each item in the supplied array
    def self.create_file(name, lines)
      file_path = File.join(write_path, name)
      File.open(file_path, "w") do |f|
        lines.each do |line|
          stripped_line = line.strip
          f.puts stripped_line unless stripped_line.empty?
        end
      end
      puts "Created file #{name} in #{write_path}" unless ENV["TESTING_VIA_RSPEC"]
      file_path
    end

    # opens url and parses document
    def self.open_page(url)
      Nokogiri.parse(open url)
    end

    def self.empty_msg
      msg = %q{No items found. Please double check your css or xpath selectors
      and ensure that the site you are trying to reach does not block scripts. }
    end
  end
end