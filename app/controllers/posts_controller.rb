class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    @new_post = Post.new
    @posts = Post.order(created_at: :desc).all
  end

  def create
    @new_post = Post.new(posts_params)
    if @new_post.save
      redirect_to "/"
    end
  end

  private
  def posts_params
    params.require(:post).permit([:comment])
  end
end
