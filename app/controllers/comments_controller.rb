class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'name', password: 'secret', only: :destroy

  before_action :set_post, only: %i[destroy create]
  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
