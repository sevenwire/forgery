class Forgery
  class Tool
    def self.dictionaries
      @@dictionaries ||= Storage.new(:dictionaries)
    end

    def self.formats
      @@formats ||= Storage.new(:formats)
    end

    def self.string_to_numbers(string, replace='#')
      string.gsub(/#{replace}/){ Kernel.rand(10) }
    end
  end
end