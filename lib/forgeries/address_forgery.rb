class AddressForgery < Forgery
  dictionaries :streets, :street_suffixes, :cities, :states, :state_abbrevs, :countries
  formats :zip, :phone, :street_number

  def self.street_name
    STREETS.random
  end

  def self.street_number
    STREET_NUMBER_FORMATS.random.to_numbers
  end

  def self.street_suffix
    STREET_SUFFIXES.random
  end

  def self.street_address
    "#{street_number} #{street_name} #{street_suffix}"
  end

  def self.city
    CITIES.random
  end

  def self.state
    STATES.random
  end

  def self.state_abbrev
    STATE_ABBREVS.random
  end

  def self.zip
    ZIP_FORMATS.random.to_numbers
  end

  def self.phone
    PHONE_FORMATS.random.to_numbers
  end

  def self.country
    COUNTRIES.random
  end
end