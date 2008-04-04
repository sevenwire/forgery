class BasicForgery < Forgery
  dictionaries :colors

  HEX_DIGITS = %w{0 1 2 3 4 5 6 7 8 9 a b c d e f}
  UPPER_ALPHA = ('A'..'Z').to_a
  LOWER_ALPHA = ('a'..'z').to_a
  NUMERIC = (0..9).to_a
  SPECIAL_CHARACTERS = %w{! ' @ # $ % ^ & * ( ) _ + - = [ ] { } ; : " , . / ?}

  def self.password(options={})
    options = {:at_least => 6,
               :at_most => 12,
               :allow_lower => true,
               :allow_upper => true,
               :allow_numeric => true,
               :allow_special => false}.merge!(options)
    self.random_text(options)
  end

  def self.encrypt(password="password", salt="salt")
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  def self.salt
    Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.password}--")
  end

  def self.boolean
    [true, false].at_rand
  end

  def self.random_text(options={})
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

    length = (options[:at_least]..options[:at_most]).at_rand

    allowed_characters.rand_subset(length, false).join
  end

  def self.number(options={})
    options = {:at_least => 1,
               :at_most => 10}.merge(options)

    (options[:at_least]..options[:at_most]).at_rand
  end

  def self.color
    COLORS.at_rand
  end

  def self.hex_color
    hex_value = ""
    6.times { hex_value << HEX_DIGITS.at_rand }
    "##{hex_value}"
  end

  def self.short_hex_color
    hex_color[0,4]
  end
end