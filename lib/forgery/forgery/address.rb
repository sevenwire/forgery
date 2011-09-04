# Generates random address information.
class Forgery::Address < Forgery

  # Gets a random street name out of the 'streets' dictionary.
  #
  #   Forgery(:address).street_name
  #   # => "Atwood"
  #
  #   Forgery(:address).street_name
  #   # => "Fordem"
  def self.street_name
    dictionaries[:streets].random.unextend
  end

  # Gets one of the formats from 'street_number_formats' and converts it to
  # numbers.
  #
  #   Forgery(:address).street_number
  #   # => 1
  #
  #   Forgery(:address).street_number
  #   # => 1234
  def self.street_number
    formats[:street_number].random.to_numbers
  end

  # Gets a random street suffix out of the 'street_suffixes' dictionary.
  #
  #   Forgery(:address).street_suffix
  #   # => "Street"
  #
  #   Forgery(:address).street_suffix
  #   # => "Parkway"
  def self.street_suffix
    dictionaries[:street_suffixes].random.unextend
  end

  # Gets a full street address, including street number, street name, and
  # street suffix.
  #
  #   Forgery(:address).street_address
  #   # => "92 West Circle"
  #
  #   Forgery(:address).street_address
  #   # => "93265 Harper Lane"
  def self.street_address
    "#{street_number} #{street_name} #{street_suffix}"
  end

  # Gets a random city out of the 'cities' dictionary.
  #
  #   Forgery(:address).city
  #   # => "Anaheim"
  #
  #   Forgery(:address).city
  #   # => "Sacramento"
  def self.city
    dictionaries[:cities].random.unextend
  end

  # Gets a random state out of the 'states' dictionary.
  #
  #   Forgery(:address).state
  #   # => "Mississippi"
  #
  #   Forgery(:address).state
  #   # => "Minnesota"
  def self.state
    dictionaries[:states].random.unextend
  end

  # Gets a random state abbreviation out of the 'state_abbrev' dictionary.
  #
  #   Forgery(:address).state_abbrev
  #   # => "GA"
  #
  #   Forgery(:address).state_abbrev
  #   # => "TX"
  def self.state_abbrev
    dictionaries[:state_abbrevs].random.unextend
  end

  # Gets a random Canadian province or territory out of the 'provinces' dictionary.
  #
  #   Forgery(:address).province
  #   # => "Ontario"
  #
  #   Forgery(:address).province
  #   # => "Northwest Territories"
  def self.province
    dictionaries[:provinces].random.unextend
  end

  # Gets a random Canadian province or territory abbreviation out of the 'province_abbrev' dictionary.
  #
  #   Forgery(:address).province_abbrev
  #   # => "ON"
  #
  #   Forgery(:address).province_abbrev
  #   # => "NT"
  def self.province_abbrev
    dictionaries[:province_abbrevs].random.unextend
  end

  # Gets one of the formats from 'zip_formats' and converts it to numbers.
  #
  #   Forgery(:address).zip
  #   # => "52474"
  #
  #   Forgery(:address).zip
  #   # => "66702-4349"
  def self.zip
    formats[:zip].random.to_numbers
  end

  # Gets one of the formats from 'phone_formats' and converts it to numbers.
  #
  #   Forgery(:address).phone
  #   # => "1-(416)185-8799"
  #
  #   Forgery(:address).phone
  #   # => "1-(589)248-0418"
  def self.phone
    formats[:phone].random.to_numbers
  end

  # Gets a random country out of the 'countries' dictionary.
  #
  #   Forgery(:address).country
  #   # => "Uruguay"
  #
  #   Forgery(:address).country
  #   # => "Romania"
  def self.country
    dictionaries[:countries].random.unextend
  end


  # Gets a random continent out of the 'continents' dictionary.
  #
  #   Forgery(:address).continent
  #   # => "Africa"
  #
  #   Forgery(:address).continent
  #   # => "Europe"
  def self.continent
    dictionaries[:continents].random.unextend
  end

end
