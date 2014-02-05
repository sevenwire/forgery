require 'spec_helper'

describe Forgery::Personal do
  describe '.gender' do
    it 'should return male or female' do
      Forgery::Tool.dictionaries[:genders].should include(Forgery::Personal.gender)
    end
  end
  
  describe '.shirt_size' do
    it 'should return a sane size' do
      Forgery::Tool.dictionaries[:shirt_sizes].should include(Forgery::Personal.shirt_size)
    end
  end
end