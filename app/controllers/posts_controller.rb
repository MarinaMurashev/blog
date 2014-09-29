class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to posts_path unless @post
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def edit
    @post = Post.find_by(id: params[:id])
    redirect_to posts_path unless @post
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update_attributes post_params
    redirect_to post_path @post.id
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

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy if @post
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
