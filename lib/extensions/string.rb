class String
  def to_numbers(replace='#')
    self.gsub(/#{replace}/){ Kernel.rand(10) }
  end
end