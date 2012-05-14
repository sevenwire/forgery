class Forgery::Internet < Forgery

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
    user_name + '@' + domain_name
  end

  def self.email_subject(options={})
    Forgery::LoremIpsum.title(options)
  end

  def self.cctld
    dictionaries[:country_code_top_level_domains].random
  end

  def self.ip_v4
    (1..4).map{rand(256)}.join('.')
  end

end
