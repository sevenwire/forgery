class Forgery::Name < Forgery

  def self.last_name
    dictionaries[:last_names].random
  end

  def self.first_name
    [dictionaries[:male_first_names], dictionaries[:female_first_names]].random.random
  end

  def self.full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.male_first_name
    dictionaries[:male_first_names].random
  end

  def self.female_first_name
    dictionaries[:female_first_names].random
  end

  def self.company_name
    dictionaries[:company_names].random
  end

  def self.job_title
    dictionaries[:job_titles].random.sub('#{N}', self.job_title_suffix)
  end

  def self.job_title_suffix
    dictionaries[:job_title_suffixes].random
  end

  def self.title
    dictionaries[:name_titles].random
  end

  def self.suffix
    dictionaries[:name_suffixes].random
  end

  def self.location
    dictionaries[:locations].random
  end

  def self.industry
    dictionaries[:industries].random
  end
end
