class Forgery::Monetary < Forgery

  def self.formatted_money(options={})
    "$%1.2f" % money(options)
  end

  def self.money(options={})
    options = {:max => 10,
               :min => 0}.merge(options)
    
    random = Random.new
    value = random.rand((options[:min] * 100)..(options[:max] * 100))
    "%1.2f" % (value.to_f / 100)
  end

end
