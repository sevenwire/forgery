class Forgery

  class Storage 

    def initialize(file_reader)
      @store = {}
      @file_reader = file_reader
    end

    def [](key)
      @store[key.to_sym] ||= begin
        contents = @file_reader.read_file(key)
        contents.extend(Forgery::Extensions::ArrayExtensions)
      end
    end

    def loaded?(key)
      @store.has_key?(key.to_sym)
    end

    def reset!
      @store = {}
    end

  end

end
