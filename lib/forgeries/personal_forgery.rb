class PersonalForgery < Forgery
  GENDERS =  %w{Male Female}
  SHIRT_SIZES = %w{XS S M L XL 2XL 3XL}
  
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