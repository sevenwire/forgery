class Forgery

  class Dictionaries

    def initialize
      @dictionaries = {}
    end

    def [](key)
      symbolized_key = key.to_sym
      @dictionaries[symbolized_key] ||= Forgery::Extend(FileReader.read_dictionary(symbolized_key))
    end

    def loaded?(key)
      @dictionaries.has_key?(key.to_sym)
    end

    def reset!
      @dictionaries = {}
    end

  end

end
