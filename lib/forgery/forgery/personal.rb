class Forgery::Personal < Forgery

  def self.gender
    dictionaries[:genders].random.unextend
  end

  def self.abbreviated_gender
    gender[0,1]
  end

  def self.shirt_size
    dictionaries[:shirt_sizes].random.unextend
  end

  def self.race
    dictionaries[:races].random.unextend
  end

  def self.language
    dictionaries[:languages].random.unextend
  end

  def self.social_security_number
    [3, 2, 4].map { |d| Forgery::Basic.number(:digits => d) }.join('-')
  end
  class << self
    alias ssn social_security_number
  end

end
