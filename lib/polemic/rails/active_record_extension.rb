module Polemic
  module ActiveRecordExtension
    def has_polemic(options = {})
      has_many :comments, :as => :commentable, :dependent => :destroy
      has_many :commentators, :through => :comments, :source => :user
      include Polemic::CommentableMethods
    end
  end
end