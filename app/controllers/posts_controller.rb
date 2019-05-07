class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:show, :new,:create, :edit, :update ,:destroy]

  def index
    @posts = Post.recent.page(params[:page]).per(10).search(params[:search]).includes(:user).includes(category: :parent)
  end

  def show
    @user = User.find_by(id: @post.user_id)
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def new
    @post = current_user.posts.new
    @category = Category.where(parent_id: "0")
    @children = Category.where(parent_id: @category)
  end

  def create
    @category = Category.where(parent_id: "0")
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "問題を作成しました"
    else
      render 'new'
      flash[:alert] = "問題作成に失敗しました"
    end
  end

  def edit
    @category = Category.where(parent_id: "0")
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:success] = "問題の編集が完了しました"
    else
      render 'edit'
      flash[:alert] = "問題の編集に失敗しました"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def get_category_id
    @category_parent = Category.find(params[:category_id])
    @category_children = @category_parent.children
    respond_to do |format|
      format.json { @category_children }
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :answer, :category_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
