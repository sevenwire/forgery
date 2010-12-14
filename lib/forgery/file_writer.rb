require 'nokogiri'
require 'open-uri'
class Forgery
  class FileWriter < Forgery
    # Creates a dictionary file with data from a web page
    def self.create_dictionary(dictionary_name, source_document, selector)
      doc = Nokogiri::XML(open(source_document))
      lines = []
      doc.search(elements_path).each do |node|
        lines << node.content unless node.content == ''
      end
      create_file(file_name, lines)
    end
    
    # Path to which new dictionaries will be written 
    # './dictionaries' by default
    def self.write_path
      @@write_path ||= File.join(File.dirname(__FILE__), :dictionaries)
    end
  
    # sets path to which new dictionaries will be written 
    def self.write_to!(path) 
      @@write_path = File.expand_path(path)
    end

    protected
    
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
  end
end