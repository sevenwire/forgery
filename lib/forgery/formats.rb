class Forgery

  class Formats

    def initialize
      @formats = {}
    end

    def [](key)
      @formats[key.to_sym] ||= begin
        contents = FileReader.read_format(key)
        contents.extend(Forgery::Extensions::ArrayExtensions)
        contents
      end
    end

    def loaded?(key)
      @formats.has_key?(key.to_sym)
    end

    def reset!
      @formats = {}
    end

  end

end
