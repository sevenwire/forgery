class PersonalForgery < Forgery

  def self.gender
    dictionaries[:genders].random
  end

  def self.abbreviated_gender
    gender[0,1]
  end

  def self.shirt_size
    dictionaries[:shirt_sizes].random
  end

  def self.race
    dictionaries[:races].random
  end

  def self.language
    dictionaries[:languages].random
  end
end
