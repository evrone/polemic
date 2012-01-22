module Polemic
  module ActiveRecordExtension
    def has_polemic(options = {})
      # field  = options[:as]     || name
      # prefix = options[:prefix] || "with"
      # raise "Blah Loaded!"
      has_many :comments, :as => :commentable
      has_many :commentators, :through => :comments, :source => :user
      include Polemic::CommentableMethods
    end
  end
end