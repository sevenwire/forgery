require 'rubygems'
require 'nokogiri'
require 'open-uri'
class Forgery

  class FileWriter
    
    # Creates a dictionary file with data from a web page
    def self.create_dictionary(dictionary_name, source_url, css_or_xpath)
      doc = open_page(source_url)
      lines = []
      doc.search(css_or_xpath).each do |node|
        lines << node.content
      end
      file_path = create_file(dictionary_name, lines)
    end
    
    # Path to which new dictionaries will be written 
    # './dictionaries' by default
    def self.write_path
      @@write_path ||= File.join(File.dirname(__FILE__), :dictionaries.to_s)
    end
  
    # sets path to which new dictionaries will be written 
    def self.write_to!(path) 
      @@write_path = File.expand_path(path)
    end

    protected
    # Creates file with a line for each item in the supplied array
    def self.create_file(name, lines)
      file_path = File.join(write_path, name)
      File.open(file_path, "w") do |f|
        lines.each do |line|
          stripped_line = line.strip
          f.puts stripped_line unless stripped_line.empty?
        end
      end
      puts "Created file #{name} in #{write_path}"
      file_path 
    end

    # opens url and parses document
    def self.open_page(url)
      doc = Nokogiri.parse(open url)
    end
  end
end