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
  
  it "commentable object should have comments" do
    commentable = Factory(:post)
    commentable.comments.class.should be Array
  end
  
  it "commentable object should have total_comments method" do
    commentable = Factory(:post)
    3.times do
      Factory(:comment, :commentable => commentable)
    end
    commentable.total_comments.should be == 3
  end
  
  it "commentable object should have total_comments right value" do
    commentable = Factory(:post)
    3.times do
      comment = Factory(:comment, :commentable => commentable)
    end
    commentable.comments.last.destroy
    commentable.total_comments.should be == 2
  end
  
  it "commentable object should have total_comments right value when mark_as_deleted was used" do
    commentable = Factory(:post)
    3.times do
      comment = Factory(:comment, :commentable => commentable)
    end
    commentable.comments.last.mark_as_deleted!
    commentable.total_comments.should be == 2
  end
end
