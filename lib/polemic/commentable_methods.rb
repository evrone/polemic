module Polemic
  module CommentableMethods
    def total_comments
      comments.actual.count
    end
  end
end