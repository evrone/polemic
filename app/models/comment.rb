class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  validates :user, :commentable, :body, :presence => true
  
  has_ancestry
  
  scope :actual, where(:deleted => false)
  
  def mark_as_deleted!
    update_attribute(:deleted, true)
  end
end