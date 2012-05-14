class Forgery
  module ToolMethods
    def dictionaries
      @@dictionaries ||= Storage.new(:dictionaries)
    end

    def formats
      @@formats ||= Storage.new(:formats)
    end

    def string_to_numbers(string, replace='#')
      string.gsub(/#{replace}/){ Kernel.rand(10) }
    end
  end

  class Tool
    extend ToolMethods
  end
end