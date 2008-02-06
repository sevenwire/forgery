# TITLE:
#
#   Random
#
# DESCRIPTION:
#
#   Randomization methods.
#
# COPYRIGHT:
#
#   Copyright (c) 2005 Ilmari Heikkinen, Christian Neukirchen, Thomas Sawyer
#
# LICENSE:
#
#   Ruby License
#
#   This module is free software. You may use, modify, and/or redistribute this
#   software under the same terms as Ruby.
#
#   This program is distributed in the hope that it will be useful, but WITHOUT
#   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#   FOR A PARTICULAR PURPOSE.
#
# AUTHORS:
#
#   - Ilmari Heikkinen <mailto:kig@misfiring.net>
#   - Christian Neukirchen <mailto:chneukirchen@gmail.com>
#   - Thomas Sawyer

# Modifications to Kernal, Hash, and String have been removed for Faker


class Array

  # Return a random element of the array.
  #
  #   [1, 2, 3, 4].at_rand           #=> 2
  #   [1, 2, 3, 4].at_rand           #=> 4
  #
  def at_rand
    self.at(Kernel.rand(size))
  end

  # Same as #at_rand, but acts in place removing a
  # random element from the array.
  #
  #   a = [1,2,3,4]
  #   a.at_rand!       #=> 2
  #   a                #=> [1,3,4]
  #
  def at_rand!
    return delete_at(Kernel.rand(size))
  end

  # Similar to #at_rand, but will return an array of randomly
  # picked exclusive elements if given a number.
  def pick(n=nil)
    if n
      a = self.dup
      a.pick!(n)
    else
      at( Kernel.rand(size))
    end
  end

  # Similar to #at_rand!, but given a number will return
  # an array of exclusive elements.
  def pick!(n=nil)
    if n
      if n > self.size
        r = self.dup
        self.replace([])
        r
      else
        r = []
        n.times { r << delete_at(Kernel.rand(size)) }
        r
      end
    else
      delete_at(Kernel.rand(size))
    end
  end

  # Random index.
  #
  def rand_index
    Kernel.rand(size)
  end

  # Returns a random subset of an Array. If a _number_
  # of elements is specified then returns that number of
  # elements, otherwise returns a random number of elements
  # upto the size of the Array.
  #
  # By defualt the returned values are exclusive of
  # each other, but if _exclusive_ is set to <tt>false</tt>,
  # the same values can be choosen more than once.
  #
  # When _exclusive_ is <tt>true</tt> (the default) and the
  # _number_ given is greater than the size of the array,
  # then all values are returned.
  #
  #   [1, 2, 3, 4].rand_subset(1)        #=> [2]
  #   [1, 2, 3, 4].rand_subset(4)        #=> [2, 1, 3, 4]
  #   [1, 2, 3, 4].rand_subset           #=> [1, 3, 4]
  #   [1, 2, 3, 4].rand_subset           #=> [2, 3]
  #
  def rand_subset( number=nil, exclusive=true )
    number = Kernel.rand(size) unless number
    number = number.to_int
    #return self.dup if (number >= size and exlusive)
    return sort_by{Kernel.rand}.slice(0,number) if exclusive
    ri =[]; number.times { |n| ri << Kernel.rand(size) }
    return values_at(*ri)
  end

  # Randomize the order of an array.
  #
  #   [1,2,3,4].shuffle  #=> [2,4,1,3]
  #
  def shuffle
    dup.shuffle!
    #sort_by{Kernel.rand}
  end

  # CREDIT Niel Spring

  # As with #shuffle but modifies the array in place.
  # The algorithm used here is known as a Fisher-Yates shuffle.
  #
  #   a = [1,2,3,4]
  #   a.shuffle!
  #   a  #=> [2,4,1,3]
  #
  def shuffle!
    s = size
    each_index do |j|
      i = Kernel.rand(s-j)
      #self[j], self[j+i] = self[j+i], self[j]
      tmp = self[j]
      self[j] = self[j+i]
      self[j+i] = tmp
    end
    self
  end

end