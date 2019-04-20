class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    redirect_to @post if @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
