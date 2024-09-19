class PostsController < ApplicationController
  # http_basic_authenticate_with  name: 'serg', password: 'secret', except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
    show_log params
  end

  def new
    @post = Post.new
  end

  def picture
    @post = params[:id]
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
    flash[:notice] = "You post is created"
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :status)
  end

  def set_post
    @post = Post.find(params[ :id])
  end

  def show_log value
    Rails.logger.info "*********#{value}**********"
  end
end
