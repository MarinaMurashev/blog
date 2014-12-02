class SitemapsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @host = request.host
    @posts = Post.all
  end
end
