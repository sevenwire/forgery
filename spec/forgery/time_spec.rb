require 'spec_helper'

describe Forgery::Time do
  it "should return a random timezone" do
    expect(Forgery.dictionaries[:zones]).to include(Forgery::Time.zone)
  end
end
