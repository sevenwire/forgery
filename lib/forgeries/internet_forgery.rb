class InternetForgery < Forgery
  dictionaries :male_first_names, :female_first_names, :last_names, :top_level_domains, :company_names

  def self.user_name
    (MALE_FIRST_NAMES.at_rand + LAST_NAMES.at_rand).downcase
  end

  def self.top_level_domain
    TOP_LEVEL_DOMAINS.at_rand
  end

  def self.domain_name
    COMPANY_NAMES.at_rand.downcase + '.' + self.top_level_domain
  end
  
  def self.email_address
    self.user_name + '@' + self.domain_name
  end
end
