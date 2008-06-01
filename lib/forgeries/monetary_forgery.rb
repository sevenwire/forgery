class MonetaryForgery < Forgery
  def self.formatted_money(options={})
    "$%1.2f" % money(options)
  end

  def self.money(options={})
    options = {:max => 10,
               :min => 0}.merge(options)

    value = ((options[:min] * 100)..(options[:max] * 100)).random
    "%1.2f" % (value.to_f / 100)
  end
end
