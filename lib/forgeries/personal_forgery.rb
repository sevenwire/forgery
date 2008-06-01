class PersonalForgery < Forgery
  def self.gender
    %w{Male Female}.random
  end

  def self.abbreviated_gender
    gender[0,1]
  end

  def self.shirt_size
    %w{XS S M L XL 2XL 3XL}.random
  end
end