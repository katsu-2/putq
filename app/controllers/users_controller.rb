class UsersController < ApplicationController

  def inde

  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
  end
end