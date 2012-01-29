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
end
