class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    redirect_back(fallback_location: post_path(@post))
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: post_path(@post))
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
