class AddressForgery < Forgery
  dictionaries :streets, :street_suffixes, :cities, :states, :state_abbrevs, :countries
  formats :zip, :phone, :street_number

  def self.street_name
    STREETS.at_rand
  end

  def self.street_number
    STREET_NUMBER_FORMATS.at_rand.numerify
  end

  def self.street_suffix
    STREET_SUFFIXES.at_rand
  end

  def self.street_address
    "#{street_number} #{street_name} #{street_suffix}"
  end

  def self.city
    CITIES.at_rand
  end

  def self.state
    STATES.at_rand
  end

  def self.state_abbrev
    STATE_ABBREVS.at_rand
  end

  def self.zip
    ZIP_FORMATS.at_rand.numerify
  end

  def self.phone
    PHONE_FORMATS.at_rand.numerify
  end

  def self.country
    COUNTRIES.at_rand
  end
end