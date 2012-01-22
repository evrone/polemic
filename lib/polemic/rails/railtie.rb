require 'rails'
# require "blah_blah_blah/ability"

module Polemic
  class Railtie < ::Rails::Railtie
    config.blah_blah_blah = ActiveSupport::OrderedOptions.new
    
    initializer "polemic.configure" do |app|
      Polemic.configure do |config|
        # config.user_name = app.config.inboxes[:user_name] || "email"
        # config.faye_enabled = app.config.inboxes[:faye_enabled] || false
        # config.faye_host = app.config.inboxes[:faye_host] || "localhost"
        # config.faye_port = app.config.inboxes[:faye_port] || "9292"
      end

      # app.config.middleware.insert_before "::Rails::Rack::Logger", "Inboxes::Middleware"
    end
    
    initializer "polemic.action_view" do |app|
      ActionView::Base.send :include, Polemic::ViewMethods
    end
    
    # def self.activate
    #   Ability.register_ability(InboxesAbility)
    # end
  end
end