require File.dirname(__FILE__) + '/../spec_helper'

describe PersonalForgery do
  describe '.gender' do
    it 'should return male or female' do
      PersonalForgery::GENDERS.should include(PersonalForgery.gender)
    end
  end
  
  describe '.shirt_size' do
    it 'should return a sane size' do
      PersonalForgery::SHIRT_SIZES.should include(PersonalForgery.shirt_size)
    end
  end
end