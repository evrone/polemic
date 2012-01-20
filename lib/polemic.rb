require "polemic/railtie"
require "polemic/engine"
require "polemic/active_record_extension"

module Polemic
  
  def self.configure(&block)
    yield @config ||= Polemic::Configuration.new
  end

  # Global settings for BlahBlahBlah
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
