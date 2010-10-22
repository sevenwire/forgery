require 'forgery'
require 'rails'

class ForgeryRailtie < Rails::Railtie
  initializer "forgery_railtie.initialize" do
    Forgery.load_from! "#{Rails.root}/lib/forgery"
  end
end
