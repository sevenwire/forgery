class PersonalForgery < Forgery
  dictionaries :races, :languages

  def self.gender
    %w{Male Female}.random
  end

  def self.abbreviated_gender
    gender[0,1]
  end

  def self.shirt_size
    %w{XS S M L XL 2XL 3XL}.random
  end

  def self.race
    RACES.random
  end

  def self.language
    LANGUAGES.random
  end
end
