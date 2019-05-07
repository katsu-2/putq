class UsersController < ApplicationController
  before_action :authenticate_user!

  def index;end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.recent.includes(category: :parent).page(params[:page]).per(6)
    @folders = Folder.where(user_id: current_user.id)
    @likes = Like.where(user_id: current_user.id)
  end
end
