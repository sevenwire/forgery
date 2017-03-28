require 'spec_helper'

describe Forgery::Personal do
  describe '.gender' do
    it 'should return male or female' do
      expect(Forgery.dictionaries[:genders]).to include(Forgery::Personal.gender)
    end
  end

  describe '.shirt_size' do
    it 'should return a sane size' do
      expect(Forgery.dictionaries[:shirt_sizes]).to include(Forgery::Personal.shirt_size)
    end
  end

  describe '.social_security_number' do
    it 'should generate a valid ssn' do
      Forgery::Personal.social_security_number.should match(/(\d{3})-(\d{2})-(\d{4})/)
    end

    it 'is aliased as .ssn' do
      Forgery::Personal.ssn.should match(/(\d{3})-(\d{2})-(\d{4})/)
    end
  end
end
