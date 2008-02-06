require File.dirname(__FILE__) + '/test_helper.rb'

class TestArrayRandom < Test::Unit::TestCase

  def test_at_rand
    a = [1,2,3,4,5]
    20.times{ assert_nothing_raised{ a.at_rand } }
    20.times{ assert( a.include?( a.at_rand ) ) }
  end

  def test_at_rand!
    a = ['a','b','c']
    assert_equal( 1, a.at_rand!.length )
    assert_equal( 2, a.length )
  end

  def test_pick
    a = ['a','b','c']
    assert_equal( 3, a.pick(3).length )
    assert_equal( 3, a.length )
    a = ['a','b','c']
    assert_equal( 3, a.pick(4).length )
    assert_equal( 3, a.length )
  end

  def test_pick!
    a = ['a','b','c']
    assert_equal( 3, a.pick!(3).length )
    assert_equal( 0, a.length )
    a = ['a','b','c']
    assert_equal( 3, a.pick!(4).length )
    assert_equal( 0, a.length )
  end

  def test_rand_index
    10.times {
      i = [1,2,3].rand_index
      assert( (0..2).include?(i) )
    }
  end

  def test_rand_subset
    10.times {
      a = [1,2,3,4].rand_subset
      assert( a.size <= 4 )
    }
  end

  def test_shuffle
    a = [1,2,3,4,5]
    b = a.shuffle
    assert_equal( a, b.sort )
  end

  def test_shuffle!
    a = [1,2,3,4,5]
    b = a.dup
    b.shuffle!
    assert_equal( a, b.sort )
  end

end