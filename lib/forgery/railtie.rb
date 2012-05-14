class Forgery
  class Railtie < Rails::Railtie
    config.to_prepare do
      Forgery.load_from! "#{Rails.root}/lib/forgery"
    end
  end
end
