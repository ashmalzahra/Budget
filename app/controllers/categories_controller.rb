class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      puts @category.errors.full_messages # Output validation errors to the console
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.where(author: current_user)
    @total = @expenses.sum(:amount)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
