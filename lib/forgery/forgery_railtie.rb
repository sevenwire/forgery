require 'forgery'
require 'rails'
require 'rake'

class ForgeryRailtie < Rails::Railtie
  config.to_prepare do
    Forgery.load_from! "#{Rails.root}/lib/forgery"
  end
end
