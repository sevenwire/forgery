require File.dirname(__FILE__) + '/../spec_helper'

describe String do
  it "should change a single # to a number 0-9" do
    (0..9).should include(Integer("#".to_numbers))
  end

  it "should change two #'s to two numbers 0-9" do
    "##".to_numbers.split("").each do |s|
      (0..9).should include(Integer(s))
    end
  end

  it "should only replace #'s in the string with numbers 0-9" do
    s = '###-###-####'
    n = s.to_numbers
    0.upto(s.size - 1) do |i|
      if s[i, 1] == "#"
        ('0'..'9').should include(n[i, 1])
      else
        ('0'..'9').should_not include(n[i, 1])
      end
    end
  end

  it "should allow the replacing of a different character" do
    (0..9).should include(Integer("-".to_numbers("-")))
  end
end
