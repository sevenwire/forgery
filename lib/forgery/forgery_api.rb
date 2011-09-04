# Alternate Forgery api, see spec/forgery_spec.rb for examples.
def Forgery(forgery, method=nil, *args)
  klass = Forgery::Extend("Forgery::#{Forgery::Extend(forgery.to_s).camelize}").constantize
  if method
    klass.send(method, *args)
  else
    klass
  end
end
