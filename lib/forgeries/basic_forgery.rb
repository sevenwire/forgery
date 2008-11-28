require 'digest/sha1'

class BasicForgery < Forgery
  HEX_DIGITS = %w{0 1 2 3 4 5 6 7 8 9 a b c d e f}
  UPPER_ALPHA = ('A'..'Z').to_a
  LOWER_ALPHA = ('a'..'z').to_a
  NUMERIC = ('0'..'9').to_a
  SPECIAL_CHARACTERS = %w{! ' @ # $ % ^ & * ( ) _ + - = [ ] { } ; : " , . / ?}
  BOOLEAN = [true, false]

  def self.password(options={})
    options = {:at_least => 6,
               :at_most => 12,
               :allow_lower => true,
               :allow_upper => true,
               :allow_numeric => true,
               :allow_special => false}.merge!(options)
    self.text(options)
  end

  def self.encrypt(password="password", salt=Time.now.to_s)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  def self.boolean
    BOOLEAN.random
  end

  def self.color
    dictionaries[:colors].random
  end

  def self.hex_color
    hex_digits = (1..6).collect { HEX_DIGITS.random}
    "##{hex_digits.join}"
  end

  def self.short_hex_color
    hex_color[0,4]
  end

  def self.number(options={})
    options = {:at_least => 1,
               :at_most => 10}.merge(options)

    (options[:at_least]..options[:at_most]).random
  end

  def self.text(options={})
    options = {:at_least => 10,
               :at_most => 15,
               :allow_lower => true,
               :allow_upper => true,
               :allow_numeric => true,
               :allow_special => false}.merge!(options)

    allowed_characters = []
    allowed_characters += LOWER_ALPHA if options[:allow_lower]
    allowed_characters += UPPER_ALPHA if options[:allow_upper]
    allowed_characters += NUMERIC if options[:allow_numeric]
    allowed_characters += SPECIAL_CHARACTERS if options[:allow_special]

    length = (options[:at_least]..options[:at_most]).random

    allowed_characters.random_subset(length).join
  end

  def self.frequency
    dictionaries[:frequencies].random
  end
end
