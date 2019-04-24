class FoldersController < ApplicationController
  before_action :get_post, only: [:new, :create]

  def index
    @folders = Folder.all.includes(:user)
  end

  def show
    @folder = Folder.find(params[:id])
    #あるフォルダーが属している中間テーブルのポスト
    @belongPosts = @folder.folder_posts
    # @folderPostIds = []

    # @belongPosts.includes(:post).each do |post|
    #   @folderPostIds << post.post.id
    # end

    # @folderPostPosts = FolderPost.where(post_id: @folderPostIds, folder_id: @folder)

  end

  def new
    @folder = current_user.folders.new
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
