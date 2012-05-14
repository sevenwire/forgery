class Forgery::Currency < Forgery

  # Generates a random currency description
  #
  #   Forgery(:currency).description
  #   # => "Australian Dollars"
  def self.description
    dictionaries[:currency_descriptions].random
  end
  
  # Generates a random currency code for a country
  #
  #   Forgery(:currency).code
  #   # => "AUD"
  def self.code
    dictionaries[:currency_codes].random
  end

end
