class NameForgery < Forgery
  dictionaries :last_names, :male_first_names, :female_first_names

  def self.last_name
    LAST_NAMES.random
  end

  def self.first_name
    [MALE_FIRST_NAMES, FEMALE_FIRST_NAMES].random.random
  end

  def self.male_first_name
    MALE_FIRST_NAMES.random
  end

  def self.female_first_name
    FEMALE_FIRST_NAMES.random
  end
end