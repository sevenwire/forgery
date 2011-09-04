# Generates random timezone information.
class Forgery::Time < Forgery

  # Gets a random timezone out of the 'timezones' dictionary
  #
  #   Forgery(:timezone).timezone
  #   # => "Sydney"
  def self.zone
    dictionaries[:zones].random.unextend
  end

end
