module CommentsHelper
  def comment_helper
    comments = Comment.all
    comments.count
  end
end
