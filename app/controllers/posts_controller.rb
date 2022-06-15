class PostsController < ApplicationController
  protect_from_forgery

  def index
  end

  def new
    @post = Post.new
  end

  def create
    render json: { url: root_path }
  end
end
