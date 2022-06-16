class PostsController < ApplicationController
  protect_from_forgery

  def index
  end

  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(posts_params)

    if @post.save
      render json: { url: root_path }
    else
      render :new
    end

  end

  def posts_params
    params.permit(:title, :body, :audio)
  end
end
