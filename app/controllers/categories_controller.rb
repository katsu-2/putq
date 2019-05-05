class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: "0")
    @child_categories = Category.where(parent_id: @categories)
    # binding.pry
  end

  def show
    @category = Category.find(params[:id])
    # @child_categories = Category.where(parent_id: @category)
    @posts = Post.where(category_id: @category)
    # binding.pry
  end
end
