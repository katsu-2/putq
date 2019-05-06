class FoldersController < ApplicationController
  before_action :get_post, only: [:new, :create]
  before_action :authenticate_user!, only: [:show, :new]

  def index
    @folders = Folder.all.includes(:user)
  end

  def show
    @folder = Folder.find(params[:id])
    @belongPosts = @folder.folder_posts
  end

  def new
    @folder = current_user.folders.new
    @posts = Post.all.includes(:user).page(params[:page]).per(10)
  end

  def create
    @folder = current_user.folders.new(folder_params)
    if @folder.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name, {post_ids: []})
  end

  def get_post
    @posts = Post.all
  end



end
