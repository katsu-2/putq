class CategoriesController < ApplicationController
  def index
    @categories = Category.where(parent_id: "0")
    # binding.pry
  end

  def show
    @category = Category.find(params[:id])
    @child_categories = Category.where(parent_id: @category)
    # binding.pry
  end
end
