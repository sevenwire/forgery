class Forgery::CreditCard < Forgery

  CARDS = [
    {:type => 'Visa', :length => 16, :prefixes => %w"4539 4556 4916 4532 4929 40240071 4485 4716 4"},
    {:type => 'MasterCard', :length => 16, :prefixes => %w"51 52 53 54 55"},
    {:type => 'American Express', :length => 15, :prefixes => %w"34 37"},
    {:type => 'Discover', :length => 16, :prefixes => ["6011"]}
  ]

  def self.type
    CARDS.choice[:type]
  end

  def self.number(options={})
    # find a card by type specified, or select a card randomly
    card = if options[:type]
      CARDS.find { |card| card[:type] == options[:type] }.clone
    else
      CARDS.choice.clone
    end
    # merge the remaining options
    card.merge!(options)
    # start the number with a prefix for this card
    number = card[:prefixes].choice
    # fill in the rest of the number with random digits, leave one space for the check digit
    (card[:length] - number.length - 1).times { number += Forgery::Basic::NUMERIC.choice }
    # add the check digit
    number += check_digit(number)
  end

 private

  def self.check_digit(number)
    # for explanation, please see: http://www.darkcoding.net/credit-card/luhn-formula/
    sum = 0
    digits = number.reverse.chars.to_a.collect { |digit| digit.to_i }
    digits.each_with_index do |digit, index|
      if index.even?
        sum += if digit * 2 > 9
          digit * 2 - 9
        else
          digit * 2
        end
      else
        sum += digit
      end
    end
    (((sum / 10 + 1) * 10 - sum) % 10).to_s
  end

end
