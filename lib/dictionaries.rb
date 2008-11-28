class Dictionaries

  def initialize
    @dictionaries = {}
  end

  def [](key)
    symbolized_key = key.to_sym
    if loaded?(symbolized_key)
      @dictionaries[symbolized_key]
    else
      @dictionaries[symbolized_key] = FileReader.read_dictionary(symbolized_key)
    end
  end

  def loaded?(key)
    @dictionaries.has_key?(key.to_sym)
  end

  def reset!
    @dictionaries = {}
  end

end
