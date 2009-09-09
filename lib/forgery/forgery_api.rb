# Alternate Forgery api, see spec/forgery_spec.rb for examples.
def Forgery(forgery, method=nil, *args)
  klass = "#{forgery.to_s.camelize}Forgery".constantize
  if method
    klass.send(method, *args)
  else
    klass
  end
end
