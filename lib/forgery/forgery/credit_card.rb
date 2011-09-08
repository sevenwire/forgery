# Generates random credit card numbers.
class Forgery::CreditCard < Forgery

  CARDS = Forgery::Extend([
    {:type => 'Visa', :length => 16, :prefixes => %w"4539 4556 4916 4532 4929 40240071 4485 4716 4"},
    {:type => 'MasterCard', :length => 16, :prefixes => %w"51 52 53 54 55"},
    {:type => 'American Express', :length => 15, :prefixes => %w"34 37"},
    {:type => 'Discover', :length => 16, :prefixes => ["6011"]}
  ])

  # Gets a random credit card type
  #
  #   Forgery(:credit_card).type
  #   # => "Visa"
  def self.type
    CARDS.random[:type]
  end

  # Gets a random credit card number
  #
  #   Forgery(:credit_card).number
  #   # => "4539750423451972"
  #
  #   Forgery(:credit_card).number(:type => 'Visa', :length => 13)
  #   # => "4556180133982"
  #
  # Supported Options
  # [:type]
  #   The credit card type. Defaults to a random selection.
  # [:length]
  #   The length of the credit card number. Defaults to the length for the selected card type.
  # [:prefixes]
  #   The allowed prefixes for the card number. Defaults to prefixes for the selected card type.
  def self.number(options={})
    # find a card by type specified, or select a card randomly
    card = if options[:type]
      CARDS.find { |card| card[:type] == options[:type] }.clone
    else
      CARDS.random.clone
    end
    # merge the remaining options
    card.merge!(options)
    # start the number with a prefix for this card
    number = Forgery::Extend(card[:prefixes]).random
    # fill in the rest of the number with random digits, leave one space for the check digit
    number << Forgery::Extend("#" * (card[:length] - number.length - 1)).to_numbers
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
