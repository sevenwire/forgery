class Forgery

  def self.dictionaries
    @@dictionaries ||= Forgery::Dictionaries.new
  end

  def self.formats
    @@formats ||= Forgery::Formats.new
  end

end
