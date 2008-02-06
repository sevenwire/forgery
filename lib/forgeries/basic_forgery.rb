class BasicForgery < Forgery

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
    allowed_characters += ('a'..'z').to_a if options[:allow_lower]
    allowed_characters += ('A'..'Z').to_a if options[:allow_upper]
    allowed_characters += (0..9).to_a if options[:allow_numeric]
    allowed_characters += ['!','\'', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '-', '=', '[', ']', '{', '}', ';', '\'', ':', '"', ',', '.', '/', '?'] if options[:allow_special]

    length = (options[:at_least]..options[:at_most]).at_rand

    allowed_characters.rand_subset(length, false).join
  end

end