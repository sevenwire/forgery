require File.dirname(__FILE__) + '/../spec_helper'

describe Forgery::Time do
  it "should return a random timezone" do
    Forgery.dictionaries[:time_zones].should include(Forgery::Time.time_zone)
  end
end