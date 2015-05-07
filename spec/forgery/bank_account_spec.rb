require 'spec_helper'

describe Forgery::BankAccount do

  describe 'ibans' do
    it 'returns a random iban' do
      expect(Forgery.dictionaries[:ibans]).to include(Forgery::BankAccount.iban)
    end
  end

  describe 'bics' do
    it 'returns a random bic' do
      expect(Forgery.dictionaries[:bics]).to include(Forgery::BankAccount.bic)
    end
  end
end
