module Forgery
  class Tool
    def self.dictionaries
      @@dictionaries ||= Storage.new(FileReader.new(:dictionaries))
    end

    def self.formats
      @@formats ||= Storage.new(FileReader.new(:formats))
    end

    def self.string_to_numbers(string, replace='#')
      string.gsub(/#{replace}/){ Kernel.rand(10) }
    end
  end
end