module Reqord
  class Railtie < Rails::Railtie
    initializer "reqord.configure_rails_initialization" do
      Rails.application.middleware.use Reqord
    end
  end
end