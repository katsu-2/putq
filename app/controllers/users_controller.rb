class UsersController < ApplicationController

  def inde

  end

  def show
    @user = User.find(params[:id])
  end
end
