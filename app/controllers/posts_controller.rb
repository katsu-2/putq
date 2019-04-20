class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:show, :new,:create, :edit, :update ,:destroy]

  def index
    @posts = Post.order('created_at desc').includes(user: :likes)
  end

  def show
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :answer)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
