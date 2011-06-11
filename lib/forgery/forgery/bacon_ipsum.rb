require "#{File.dirname(__FILE__)}/lorem_ipsum.rb"

# A BIG BIG thanks to @GunGeekATX for creating http://baconipsum.com/
class Forgery::BaconIpsum < Forgery::LoremIpsum
  
  DICT_KEY = :bacon_ipsum
    
protected

  def self.bacon_ipsum_words
    @@bacon_ipsum_words ||= dictionaries[DICT_KEY].join(" ").downcase.gsub(/\.|,|;/, '').split(" ")
  end

  def self.bacon_ipsum_characters
    @@bacon_ipsum_characters ||= dictionaries[DICT_KEY].join("").downcase.gsub(/[^a-z\s]/,'')
  end

  class << self
    alias_method :lorem_ipsum_words, :bacon_ipsum_words
    alias_method :lorem_ipsum_characters, :bacon_ipsum_characters
  end

end
