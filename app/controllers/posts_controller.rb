class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end
end
