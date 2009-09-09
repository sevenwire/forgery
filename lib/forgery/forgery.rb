class Forgery

  def self.dictionaries
    @@dictionaries ||= Dictionaries.new
  end

  def self.formats
    @@formats ||= Formats.new
  end

end
