class Forgery

  class Storage 

    def initialize(folder)
      @store = {}
      @folder = folder 
    end

    def [](key)
      @store[key.to_sym] ||= begin
        contents = FileReader.read_file_from_folder(key, @folder)
        contents.extend(Forgery::Extensions::ArrayExtensions)
        contents
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
