class PersonalForgery < Forgery
  dictionaries :races, :languages, :shirt_sizes, :genders

  def self.gender
    GENDERS.random
  end

  def self.abbreviated_gender
    gender[0,1]
  end

  def self.shirt_size
    SHIRT_SIZES.random
  end

  def self.race
    RACES.random
  end

  def self.language
    LANGUAGES.random
  end
end
