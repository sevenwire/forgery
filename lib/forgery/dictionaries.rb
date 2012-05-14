class Forgery

  class Dictionaries

    def initialize
      @dictionaries = {}
    end

    def [](key)
      @dictionaries[key.to_sym] ||= begin
        contents = FileReader.read_dictionary(key)
        contents.extend(Forgery::Extensions::ArrayExtensions)
        contents
      end
    end

    def loaded?(key)
      @dictionaries.has_key?(key.to_sym)
    end

    def reset!
      @dictionaries = {}
    end

  end

end
