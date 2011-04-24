require 'date'

class Forgery::Date < Forgery
  DAYS = %w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}
  DAYS_ABBR = %w{Sun Mon Tue Wed Thu Fri Sat}
  MONTHS = %w{January February March April May June July August September October November December}
  MONTHS_ABBR = %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)

  def self.day_of_week(options={})
    options.reverse_merge!(:abbr => false)

    if (options[:abbr])
      DAYS_ABBR.random
    else
      DAYS.random
    end
  end

  def self.month(options={})
    options.reverse_merge!(:abbr => false, :numerical => false)

    if (options[:numerical])
      1 + rand(12)
    else
      if (options[:abbr])
        MONTHS_ABBR.random
      else
        MONTHS.random
      end
    end

  end

  def self.year(options={})
    options.reverse_merge!(:future => false, :past => false, :min_delta => 0, :max_delta => 20)

    #Apply our delta to this year
    DateTime.now.year + delta(options)
  end

  def self.day
    1 + rand(31)
  end

  def self.date(options={})
    options.reverse_merge!(:future => false, :past => false, :min_delta => 0, :max_delta => 7300)

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
