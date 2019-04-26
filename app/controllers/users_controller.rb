class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.recent.page(params[:page]).per(6)
  end
end
