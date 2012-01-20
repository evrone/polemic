module Polemic
  module ActiveRecordExtension
    def has_polemic(options = {})
      # field  = options[:as]     || name
      # prefix = options[:prefix] || "with"
      # raise "Blah Loaded!"
      has_many :comments, :as => :commentable
      has_many :commentators, :through => :comments
      
      Rails.application.routes.draw do
        resources :comments, :except => [:edit, :update], :module => :"Polemic"
      end
    end
  end
end