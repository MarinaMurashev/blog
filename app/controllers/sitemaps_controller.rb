class SitemapsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.all
  end

end
