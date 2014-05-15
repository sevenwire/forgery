require 'spec_helper'
require 'date'

describe Forgery::Date do
  describe '.day_of_week' do
    it 'should return a day of the week' do
      expect(Date::DAYNAMES).to include(Forgery::Date.day_of_week)
    end
  end

  describe '.day_of_week(:abbr => true)' do
    it 'should return a day of the week in abbreviated form' do
      expect(Date::ABBR_DAYNAMES).to include(Forgery::Date.day_of_week(:abbr => true))
    end
  end

  describe '.month' do
    it 'should return a valid month' do
      expect(Date::MONTHNAMES).to include(Forgery::Date.month)
    end
  end

  describe '.month(:abbr => true)' do
    it 'should return a valid month in abbreviated form' do
      expect(Date::ABBR_MONTHNAMES).to include(Forgery::Date.month(:abbr => true))
    end
  end

  describe '.month(:numerical => true)' do
    it 'should return a valid month in numeric form' do
      expect([1,2,3,4,5,6,7,8,9,10,11,12]).to include(Forgery::Date.month(:numerical => true))
    end
  end

  describe '.year' do
    it 'should return a valid year within 20 years of the current year' do
      year = Forgery::Date.year
      expect(year).to be > Date.today.year - 21
      expect(year).to be < Date.today.year + 21
    end
  end

  describe '.year(:future => true)' do
    it 'should return a year greater than the current one' do
      year = Forgery::Date.year(:future => true)
      expect(year).to be >= Date.today.year
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 5, :future => true)' do
    it 'should return a year 5 years from the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 5, :future => true)
      expect(year).to eq(Date.today.year + 5)
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 10, :future => true)' do
    it 'should return a year that is between 5 and 10 years greater than the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 10, :future => true)
      expect((0..5).map { |i| Date.today.year + i + 5 }).to include(year)
    end
  end

  describe '.year(:past => true)' do
    it 'should return a year less than the current one' do
      year = Forgery::Date.year(:past => true)
      expect(year).to be <= Date.today.year
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 5, :past => true)' do
    it 'should return a year 5 years until the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 5, :past => true)
      expect(year).to eq(Date.today.year - 5)
    end
  end

  describe '.year(:min_delta => 5, :max_delta => 10, :past => true)' do
    it 'should return a year that is between 5 and 10 years less than the current one' do
      year = Forgery::Date.year(:min_delta => 5, :max_delta => 10, :past => true)
      expect((0..5).map { |i| Date.today.year - i - 5 }).to include(year)
    end
  end

  describe '.date' do
    it 'should return a valid date within 7300 days of the current date' do
      date = Forgery::Date.date
      expect(date).to be > Date.today - 7300
      expect(date).to be < Date.today + 7300
    end
  end

  describe '.date(:future => true)' do
    it 'should return a date greater than the current one' do
      date = Forgery::Date.date(:future => true)
      expect(date).to be >= Date.today
    end
  end

  describe '.date(:min_delta => 5, :max_delta => 5, :future => true)' do
    it 'should return a date 5 days from the current one' do
      date = Forgery::Date.date(:min_delta => 5, :max_delta => 5, :future => true)
      expect(date).to eq(Date.today + 5)
    end
  end

  describe '.date(:min_delta => 5, :max_delta => 10, :future => true)' do
    it 'should return a date that is between 5 and 10 days greater than the current one' do
      date = Forgery::Date.date(:min_delta => 5, :max_delta => 10, :future => true)
      expect((0..5).map { |i| Date.today + i + 5 }).to include(date)
    end
  end

  describe '.date(:past => true)' do
    it 'should return a date less than the current one' do
      date = Forgery::Date.date(:past => true)
      expect(date).to be <= Date.today
    end
  end

  describe '.date(:min_delta => 5, :max_delta => 5, :past => true)' do
    it 'should return a date 5 days until the current one' do
      date = Forgery::Date.date(:min_delta => 5, :max_delta => 5, :past => true)
      expect(date).to eq(Date.today - 5)
    end
  end

  describe '.date(:min_delta => 5, :max_delta => 10, :past => true)' do
    it 'should return a date that is between 5 and 10 days less than the current one' do
      date = Forgery::Date.date(:min_delta => 5, :max_delta => 10, :past => true)
      expect((0..5).map { |i| Date.today - i - 5 }).to include(date)
    end
  end
end
