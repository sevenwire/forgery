require 'spec_helper'

describe String do
  it "should change a single # to a number 0-9" do
    expect(0..9).to include(Integer(Forgery::Extend("#").to_numbers))
  end

  it "should change two #'s to two numbers 0-9" do
    Forgery::Extend("##").to_numbers.split("").each do |s|
      expect(0..9).to include(Integer(s))
    end
  end

  it "should only replace #'s in the string with numbers 0-9" do
    s = Forgery::Extend('###-###-####')
    n = s.to_numbers
    0.upto(s.size - 1) do |i|
      if s[i, 1] == "#"
        expect('0'..'9').to include(n[i, 1])
      else
        expect('0'..'9').not_to include(n[i, 1])
      end
    end
  end

  it "should allow the replacing of a different character" do
    expect(0..9).to include(Integer(Forgery::Extend("-").to_numbers("-")))
  end
end
