require 'ancestry'
require "polemic/rails/railtie"
require "polemic/rails/engine"
require "polemic/rails/active_record_extension"
require 'polemic/rails/action_view_extension'
require "polemic/standart_renderer"
require "polemic/commentable_methods"

module Polemic
  
  def self.configure(&block)
    yield @config ||= Polemic::Configuration.new
  end

  # Global settings for Polemic
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    # config_accessor :user_name
    # config_accessor :faye_host
    # config_accessor :faye_port
    # config_accessor :faye_enabled

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call() : config.param_name 
    end
  end
  
  # adding method inboxes for models
  ActiveRecord::Base.extend(Polemic::ActiveRecordExtension)
  
end
