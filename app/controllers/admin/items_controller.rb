class Admin::ItemsController < ApplicationController
	def index
		@category = Category.find(params[:category_id])
		@items = @category.items.all
	end
	def new
		@category = Category.find(params[:category_id])
		@item = Item.new
	end
	def create
		@category = Category.find(params[:category_id])
		@item = @category.items.create(item_params)
		redirect_to admin_category_item_index_path
	end
	def show
		@category = Category.find(params[:category_id])
		@item = @category.items.find(params[:id])
	end
	def destroy
		@category = Category.find(params[:category_id])
		@item = @category.items.find(params[:id])
		@item.destroy
		redirect_to admin_category_item_index_path
	end
	private
		def item_params
			params.require(:item).permit(:name,:category_id)
		end
end

