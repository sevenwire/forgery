class ForgeryGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'lib'
      m.directory 'lib/forgery'
      m.directory 'lib/forgery/dictionaries'
      m.directory 'lib/forgery/extensions'
      m.directory 'lib/forgery/forgeries'
      m.directory 'lib/forgery/formats'
    end
  end
end
