# Generates random address information.
class AddressForgery < Forgery
  dictionaries :streets, :street_suffixes, :cities, :states, :state_abbrevs, :countries
  formats :zip, :phone, :street_number

  # Gets a random street name out of the 'streets' dictionary.
  #
  #   AddressForgery.street_name
  #   # => "Atwood"
  #
  #   AddressForgery.street_name
  #   # => "Fordem"
  def self.street_name
    STREETS.random
  end

  # Gets one of the formats from 'street_number_formats' and converts it to
  # numbers.
  #
  #   AddressForgery.street_number
  #   # => 1
  #
  #   AddressForgery.street_number
  #   # => 1234
  def self.street_number
    STREET_NUMBER_FORMATS.random.to_numbers
  end

  # Gets a random street suffix out of the 'street_suffixes' dictionary.
  #
  #   AddressForgery.street_suffix
  #   # => "Street"
  #
  #   AddressForgery.street_suffix
  #   # => "Parkway"
  def self.street_suffix
    STREET_SUFFIXES.random
  end

  # Gets a full street address, including street number, street name, and
  # street suffix.
  #
  #   AddressForgery.street_address
  #   # => "92 West Circle"
  #
  #   AddressForgery.street_address
  #   # => "93265 Harper Lane"
  def self.street_address
    "#{street_number} #{street_name} #{street_suffix}"
  end

  # Gets a random city out of the 'cities' dictionary.
  #
  #   AddressForgery.city
  #   # => "Anaheim"
  #
  #   AddressForgery.city
  #   # => "Sacramento"
  def self.city
    CITIES.random
  end

  # Gets a random state out of the 'states' dictionary.
  #
  #   AddressForgery.state
  #   # => "Mississippi"
  #
  #   AddressForgery.state
  #   # => "Minnesota"
  def self.state
    STATES.random
  end

  # Gets a random state abbreviation out of the 'state_abbrev' dictionary.
  #
  #   AddressForgery.state_abbrev
  #   # => "GA"
  #
  #   AddressForgery.state_abbrev
  #   # => "TX"
  def self.state_abbrev
    STATE_ABBREVS.random
  end

  # Gets one of the formats from 'zip_formats' and converts it to numbers.
  #
  #   AddressForgery.zip
  #   # => "52474"
  #
  #   AddressForgery.zip
  #   # => "66702-4349"
  def self.zip
    ZIP_FORMATS.random.to_numbers
  end

  # Gets one of the formats from 'phone_formats' and converts it to numbers.
  #
  #   AddressForgery.phone
  #   # => "1-(416)185-8799"
  #
  #   AddressForgery.phone
  #   # => "1-(589)248-0418"
  def self.phone
    PHONE_FORMATS.random.to_numbers
  end

  # Gets a random country out of the 'countries' dictionary.
  #
  #   AddressForgery.country
  #   # => "Uruguay"
  #
  #   AddressForgery.country
  #   # => "Romania"
  def self.country
    COUNTRIES.random
  end
end
