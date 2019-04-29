class Admin::CategoriesController < ApplicationController
 def new
  @categories = Category.new 
 end
 def create
  @categories = Category.new(category_params)
  if @categories.save
    render 'show'
  else
    redirect_to new_admin_category_path
  end
 end
 def show
  @categories = Category.find(params[:id])
 end

 private
  def category_params
    params.require(:category).permit(:name)
  end
end
