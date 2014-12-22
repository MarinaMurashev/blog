class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @post = Post.friendly.find(params[:id])
  rescue
    redirect_to posts_path
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def edit
    @post = Post.friendly.find(params[:id])
  rescue
    redirect_to posts_path
  end

  def update
    @post = Post.friendly.find(params[:id])
    @post.update_attributes post_params
    redirect_to post_path @post.slug
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:notice] = "Post has been saved successfully."
      redirect_to root_path
    else
      flash.now[:error] = @post.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy if @post
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
