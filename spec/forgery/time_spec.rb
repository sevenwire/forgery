require 'spec_helper'

describe Forgery::Time do
  it "should return a random timezone" do
    Forgery.dictionaries[:zones].should include(Forgery::Time.zone)
  end
end
