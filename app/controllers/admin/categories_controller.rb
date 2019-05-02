class Admin::CategoriesController < ApplicationController
  before_action :check_user_type
 def index
    @categories = Category.all
 end
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
 def edit
  @categories = Category.find(params[:id])
 end
 def show
  @categories = Category.find(params[:id])
 end
 def update
   @categories = Category.find(params[:id])
    if @categories.update(category_params)
      render 'show'
    else
      redirect_to edit_admin_category_path
    end      
 end
 def destroy
  @categories = Category.find(params[:id])
  @categories.destroy
  redirect_to admin_categories_path
 end

 private
  #permited parameters
  def category_params
    params.require(:category).permit(:name)
  end
  #to check the user type
  def check_user_type
    if current_user.user_type == true    #for admin its false
      redirect_to root_path
    end
  end
end
