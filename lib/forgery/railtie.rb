require 'forgery'
require 'rails'

module Forgery
  class Railtie < Rails::Railtie
    initializer "forgery.initialize" do
      Forgery.load_from! "#{Rails.root}/lib/forgery"
    end
  end
end