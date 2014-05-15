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
end