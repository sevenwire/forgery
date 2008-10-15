class NameForgery < Forgery
  dictionaries :last_names, :male_first_names, :female_first_names, :company_names,
    :name_suffixes, :name_titles

  def self.last_name
    LAST_NAMES.random
  end

  def self.first_name
    [MALE_FIRST_NAMES, FEMALE_FIRST_NAMES].random.random
  end

  def self.full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.male_first_name
    MALE_FIRST_NAMES.random
  end

  def self.female_first_name
    FEMALE_FIRST_NAMES.random
  end

  def self.company_name
    COMPANY_NAMES.random
  end

  def self.title
    NAME_TITLES.random
  end

  def self.suffix
    NAME_SUFFIXES.random
  end
end
