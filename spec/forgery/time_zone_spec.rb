require File.dirname(__FILE__) + '/../spec_helper'

describe Forgery::TimeZone do
  it "should return a random timezone" do
    Forgery.dictionaries[:zones].should include(Forgery::TimeZone.zone)
  end
end