class PersonalForgery < Forgery
  dictionaries :shirt_sizes, :genders
  
  def self.gender
    GENDERS.random
  end

  def self.abbreviated_gender
    gender[0,1]
  end

  def self.shirt_size
    SHIRT_SIZES.random
  end
end