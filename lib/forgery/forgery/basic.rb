require 'digest/sha1'

class Forgery::Basic < Forgery

  HEX_DIGITS = Forgery::Extend(%w{0 1 2 3 4 5 6 7 8 9 a b c d e f})
  UPPER_ALPHA = Forgery::Extend(('A'..'Z').to_a)
  LOWER_ALPHA = Forgery::Extend(('a'..'z').to_a)
  NUMERIC = Forgery::Extend(('0'..'9').to_a)
  SPECIAL_CHARACTERS = Forgery::Extend(%w{! ' @ # $ % ^ & * ( ) _ + - = [ ] { } ; : " , . / ?})
  BOOLEAN = Forgery::Extend([true, false])

  # Gets a random string for use as a password
  #
  #   Forgery(:basic).password
  #   # => "1MbyMQhU"
  #
  #   Forgery(:basic).password(:at_least => 3, :at_most => 5)
  #   # => "WbgP"
  #
  # Supported Options
  # [:at_least]
  #   The minimum length the password may be. Defaults to 6.
  # [:at_most]
  #   The maximum length the password may be. Defaults to 12.
  # [:allow_lower]
  #   Allow lowercase characters. Defaults to true.
  # [:allow_upper]
  #   Allow uppercase characters. Defaults to true.
  # [:allow_numeric]
  #   Allow numbers. Defaults to true.
  # [:allow_special]
  #   Allow special characters. Defaults to false.
  def self.password(options={})
    options = {:at_least => 6,
               :at_most => 12,
               :allow_lower => true,
               :allow_upper => true,
               :allow_numeric => true,
               :allow_special => false}.merge!(options)
    text(options)
  end

  # SHA1 hexdigests a password salted with the current time
  #
  #   Forgery(:basic).encrypt
  #   # => "b2fbd3955a36068e93e0b9db45bcb178f08336f5"
  #
  #   Forgery(:basic).encrypt('your-password')
  #   # => "00932bafce4a9391f888ca77f81f98b8e89d3aa6"
  #
  #   Forgery(:basic).encrypt('your-password', Time.utc(2009))
  #   # => "4b157c2fbf430b962842d21926eaa887c3a12f81"
  def self.encrypt(password="password", salt=::Time.now.to_s)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Gets a random boolean value
  #
  #   Forgery(:basic).boolean
  #   # => true
  #
  #   Forgery(:basic).boolean
  #   # => false
  def self.boolean
    BOOLEAN.random
  end

  def self.color
    dictionaries[:colors].random.unextend
  end

  def self.hex_color
    hex_digits = (1..6).collect { HEX_DIGITS.random.unextend}
    "##{hex_digits.join}"
  end

  def self.short_hex_color
    hex_color[0,4]
  end

  def self.number(options={})
    options = {:at_least => 1,
               :at_most => 10}.merge(options)

    Forgery::Extend(options[:at_least]..options[:at_most]).random
  end

  def self.text(options={})
    options = {:at_least      => 10,
               :at_most       => 15,
               :allow_lower   => true,
               :allow_upper   => true,
               :allow_numeric => true,
               :allow_special => false,
               :exactly       => nil}.merge!(options)

    allowed_characters = []
    allowed_characters += LOWER_ALPHA if options[:allow_lower]
    allowed_characters += UPPER_ALPHA if options[:allow_upper]
    allowed_characters += NUMERIC if options[:allow_numeric]
    allowed_characters += SPECIAL_CHARACTERS if options[:allow_special]

    length = options[:exactly] || Forgery::Extend(options[:at_least]..options[:at_most]).random

    Forgery::Extend(allowed_characters).random_subset(length).join
  end

  def self.frequency
    dictionaries[:frequencies].random.unextend
  end

end
