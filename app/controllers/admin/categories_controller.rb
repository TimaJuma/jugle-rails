class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], 
  password: ENV["PASSWORD"]


  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @new_category = Category.new(category_value)

    if @new_category.save
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  private

  def category_value
    params.require(:category).permit( :name)
  end

  
end
