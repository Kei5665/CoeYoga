class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index
  def index
    @posts = Post.all
  end
end
