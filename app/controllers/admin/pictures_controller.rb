class Admin::class PicturesController < ApplicationController
	before_action :local_post
	def index
		@picture = @imageable.pictures.all		
	end
	def new
		@picture = @imageable.pictures.new		
	end
	def create
		@image = @imageable.pictures.new(params.require(:picture).permit(:image))
		if @image.save
			redirect_to post_picture_path(@imageable,@image)
		else
			render 'new'
		end
	end
	def show
		@picture = @imageable.pictures.find(params[:id])

	end
	def destroy
		@picture = @imageable.pictures.find(params[:id])
		@picture.destroy
		redirect_to post_pictures_path
	end
	private
	def local_post
		resources, id = request.path.split('/')[4, 5]
		@imageable = resources.singularize.classify.constantize.find(id)
	end
end
