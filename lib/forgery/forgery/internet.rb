require 'ipaddr'

class Forgery::Internet < Forgery

  def self.user_name
    (dictionaries[:male_first_names].random[0,1] + dictionaries[:last_names].random).downcase
  end

  def self.top_level_domain
    dictionaries[:top_level_domains].random.unextend
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
    dictionaries[:country_code_top_level_domains].random.unextend
  end

  def self.ip_v4
    (1..4).map{rand(256)}.join('.')
  end

  # credit for this method from http://stackoverflow.com/a/2811349/793330
  def self.ip_v6
    IPAddr.new(rand(2**128),Socket::AF_INET6).to_s
  end

end
