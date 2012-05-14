# Alternate Forgery api, see spec/forgery_spec.rb for examples.
def Forgery(forgery, method=nil, *args)
  warn "The Forgery() method has been deprecated and will be removed in v1.1. Use Forgery[] instead."
  klass = Forgery[forgery]
  if method
    klass.send(method, *args)
  else
    klass
  end
end
