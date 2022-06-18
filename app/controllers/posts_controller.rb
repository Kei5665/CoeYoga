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

    @post = Post.new(posts_params)

    audio = "/Users/kei/Desktop/coeyoga/public/" + @post.audio.url
    connection = Faraday.new(url: 'https://api.webempath.net/v2/analyzeWav') do |f|
      f.request :multipart
      f.request :url_encoded
      f.response :logger
      f.adapter Faraday.default_adapter
    end

    response = connection.post do |req|
      req.body = {
        'apikey': 'vUOfl-btNyJdBwt7Iml-AlmlCnADZOZm93NUwzgrg8s',
        'wav': Faraday::Multipart::FilePart.new(audio, 'audio/wav')
      }
    end

    render json: { url: root_path }
  end

  private

  def posts_params
    params.permit(:title, :body, :audio)
  end
end
