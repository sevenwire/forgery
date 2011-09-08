class Forgery
  def self.Extend(object)
    case object
    when Array
      Forgery::Extensions::Array.new(object)
    when Range
      Forgery::Extensions::Range.new(object.first, object.last, object.exclude_end?)
    when String
      Forgery::Extensions::String.new(object)
    else
      object
    end
  end
end
