class InternetForgery < Forgery
  def self.user_name
    (dictionaries[:male_first_names].random[0,1] + dictionaries[:last_names].random).downcase
  end

  def self.top_level_domain
    dictionaries[:top_level_domains].random
  end

  def self.domain_name
    dictionaries[:company_names].random.downcase + '.' + self.top_level_domain
  end
  
  def self.email_address
    self.user_name + '@' + self.domain_name
  end
end
