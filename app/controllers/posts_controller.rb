class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to posts_path unless @post
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to root_path
    else
      render action: "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
