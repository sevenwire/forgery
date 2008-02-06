require File.dirname(__FILE__) + '/test_helper.rb'

class TestForgery < Test::Unit::TestCase
  def test_numerify
    assert Forgery.numerify('###').match(/\d{3}/)
  end
end
