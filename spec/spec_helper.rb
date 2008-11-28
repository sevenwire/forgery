require 'spec'
require File.dirname(__FILE__) + '/../init'

Spec::Runner.configure do |config|
  
end

class OnlyContain
  def initialize(*expected)
    @expected = [expected].flatten
  end

  def matches?(target)
     @target = target.dup
     @expected.each do |e|
       target.gsub!(e, '')
     end
     target.size == 0
  end

  def failure_message
    "expected #{@target} to only contain #{@expected.join(', ')}"
  end

  def failure_message
    "expected #{@target} to not only contain #{@expected.join(', ')}"
  end
end

def only_contain(*expected)
  OnlyContain.new(expected)
end
