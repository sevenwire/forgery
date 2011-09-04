require 'spec_helper'

describe Forgery::Name do
  it "should return a random first name" do
    (Forgery.dictionaries[:male_first_names] + Forgery.dictionaries[:female_first_names]).should include(Forgery::Name.first_name)
  end

  it "should return a random last name" do
    Forgery.dictionaries[:last_names].should include(Forgery::Name.last_name)
  end
end
