class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: "0")
    @child_categories = Category.where(parent_id: @categories)
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: @category).includes(:user).includes(:category)
  end
end
