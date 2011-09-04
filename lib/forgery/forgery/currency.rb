class Forgery::Currency < Forgery

  # Generates a random currency description
  #
  #   Forgery(:currency).description
  #   # => "Australian Dollars"
  def self.description
    dictionaries[:currency_descriptions].random.unextend
  end
  
  # Generates a random currency code for a country
  #
  #   Forgery(:currency).code
  #   # => "AUD"
  def self.code
    dictionaries[:currency_codes].random.unextend
  end

end
