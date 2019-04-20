class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    redirect_to @post if @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
