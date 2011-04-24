require 'spec_helper'
require 'date'

describe Forgery::Date do
  describe '.day_of_week' do
    it 'should return a day of the week' do
      Date::DAYNAMES.should include(Forgery::Date.day_of_week)
    end
  end

  describe '.day_of_week(:abbr => true)' do
    it 'should return a day of the week in abbreviated form' do
      Date::ABBR_DAYNAMES.should include(Forgery::Date.day_of_week(:abbr => true))
    end
  end

  describe '.month' do
    it 'should return a valid month' do
      Date::MONTHNAMES.should include(Forgery::Date.month)
    end
  end

  describe '.month(:abbr => true)' do
    it 'should return a valid month in abbreviated form' do
      Date::ABBR_MONTHNAMES.should include(Forgery::Date.month(:abbr => true))
    end
  end

  describe '.month(:numerical => true)' do
    it 'should return a valid month in numeric form' do
      [1,2,3,4,5,6,7,8,9,10,11,12].should include(Forgery::Date.month(:numerical => true))
    end
  end

  describe '.year' do
    it 'should return a valid year within 20 years of the current year' do
      year = Forgery::Date.year
      year.should > Date.today.year - 21
      year.should < Date.today.year + 21
    end
  end

  describe '.year(:future => true)' do
    it 'should return a year greater than the current one' do
      year = Forgery::Date.year(:future => true)
      year.should >= Date.today.year
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 5, :future => true)' do
    it 'should return a year 5 years from the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 5, :future => true)
      year.should >= Date.today.year + 5
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 10, :future => true)' do
    it 'should return a year that is between 5 and 10 years greater than the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 10, :future => true)
      (0..5).map { |i| Date.today.year + i + 5 }.should include(year)
    end
  end

  describe '.year(:past => true)' do
    it 'should return a year less than the current one' do
      year = Forgery::Date.year(:past => true)
      year.should <= Date.today.year
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 5, :past => true)' do
    it 'should return a year 5 years until the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 5, :past => true)
      year.should == Date.today.year - 5
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 10, :past => true)' do
    it 'should return a year that is between 5 and 10 years less than the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 10, :past => true)
      (0..5).map { |i| Date.today.year - i - 5 }.should include(year)
    end
  end
end
