# Generates random geographic information.
class Forgery::Geo < Forgery

  # Return a latitude in the range -90.0 to +90.0 as a float.
  def self.latitude
    rand * 180.0 - 90.0
  end

  # Return a latitude's degrees component in the range -180 to +180 as an integer.
  def self.latitude_degrees
    rand(360)-180
  end

  # Return a latitude's minutes component in the range 0 to 60 as an integer.
  def self.latitude_minutes
    rand(60)
  end

  # Return a latitude's seconds component in the range 0 to 60 as an integer.
  def self.latitude_seconds
    rand(60)
  end

  # Return a latitude's direction component, either "N" (north) or "S" (south)
  def self.latitude_direction
    ['N','S'].sample
  end

  # Return a longitude in the range -180.0 to +180.0 as a float.
  def self.longitude
    rand * 360.0 - 180.0
  end

  # Return a longitude's degrees component in the range -180 to +180 as an integer.
  def self.longitude_degrees
    rand(360)-180
  end

  # Return a longitude's minutes component in the range 0 to 60 as an integer.
  def self.longitude_minutes
    rand(60)
  end

  # Return a longitude's seconds component in the range 0 to 60 as an integer.
  def self.longitude_seconds
    rand(60)
  end

  # Return a longitude's direction component, either "E" (east) or "W" (west)
  def self.longitude_direction
    ["E","W"].sample
  end

end
