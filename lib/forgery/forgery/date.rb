require 'date'

class Forgery::Date < Forgery
  DAYS = Forgery::Extend(%w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday})
  DAYS_ABBR = Forgery::Extend(%w{Sun Mon Tue Wed Thu Fri Sat})
  MONTHS = Forgery::Extend(%w{January February March April May June July August September October November December})
  MONTHS_ABBR = Forgery::Extend(%w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec))

  def self.day_of_week(options={})
    options = {:abbr => false}.merge(options)

    if (options[:abbr])
      DAYS_ABBR.random.unextend
    else
      DAYS.random.unextend
    end
  end

  def self.month(options={})
    options = {:abbr => false, :numerical => false}.merge(options)

    if (options[:numerical])
      1 + rand(12)
    else
      if (options[:abbr])
        MONTHS_ABBR.random.unextend
      else
        MONTHS.random.unextend
      end
    end

  end

  def self.year(options={})
    options = {:future => false, :past => false, :min_delta => 0, :max_delta => 20}.merge(options)

    #Apply our delta to this year
    DateTime.now.year + delta(options)
  end

  def self.day
    1 + rand(31)
  end

  def self.date(options={})
    options = {:future => false, :past => false, :min_delta => 0, :max_delta => 7300}.merge(options)

    #Apply our delta to today
    ::Date.today + delta(options)
  end

  private
  #Calculate our delta
  def self.delta(options)
    delta = options[:min_delta] + rand(options[:max_delta] + 1 - options[:min_delta]).to_i

    #Potentially negate our delta if future is false
    unless (options[:future])
      if options[:past] || rand(2).zero?
        delta *= -1
      end
    end
    delta
  end
end
