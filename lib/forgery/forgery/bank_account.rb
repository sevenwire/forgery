# Generates random bank account information
class Forgery::BankAccount < Forgery
  
  # Gets a random iban out of the 'ibans' dictionary.
  #
  #   Forgery(:bank_account).iban
  #   # => "BE68539007547034"
  #
  #   Forgery(:bank_account).iban
  #   # => "FI2112345600000785"
  def self.iban
    dictionaries[:ibans].random.unextend
  end

  # Gets a random bic out of the 'bics' dictionary.
  #
  #   Forgery(:bank_account).bic
  #   # => "AARBDE5W100"
  #
  #   Forgery(:bank_account).bic
  #   # => "GENODEF1PA1"
  def self.bic
    dictionaries[:bics].random.unextend
  end
end
