require 'spec_helper'

describe Forgery::Name do
  it "should return a random first name" do
    expect(Forgery.dictionaries[:male_first_names] + Forgery.dictionaries[:female_first_names]).to include(Forgery::Name.first_name)
  end

  it "should return a random last name" do
    expect(Forgery.dictionaries[:last_names]).to include(Forgery::Name.last_name)
  end
end
