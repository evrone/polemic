require "spec_helper"

describe Comment do
  it "has mark_as_deleted! method" do
    comment = Comment.new
    comment.respond_to?("mark_as_deleted!").should be_true
  end
  
  it "mark_as_deleted! should mark comment as deleted" do
    comment = Factory(:comment)
    comment.mark_as_deleted!
    comment.deleted.should be_true
  end
  
  it "actual comments should not include deleted comments" do
    2.times do
      Factory(:comment)
    end
    deleted_comment = Factory(:comment)
    deleted_comment.mark_as_deleted!
    Comment.actual.should_not include deleted_comment 
  end
end
