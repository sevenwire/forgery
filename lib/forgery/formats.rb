class Forgery

  class Formats

    def initialize
      @formats = {}
    end

    def [](key)
      symbolized_key = key.to_sym
      @formats[symbolized_key] ||= Forgery::Extend(FileReader.read_format(symbolized_key))
    end

    def loaded?(key)
      @formats.has_key?(key.to_sym)
    end

    def reset!
      @formats = {}
    end

  end

end
