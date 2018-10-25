class ImagesController < ApplicationController
	def new
		@image = Image.new
	end	
	def create
  @image = current_user.images.build(image_params)
    if @image.save
      redirect_to image_path(@image)
    else
      render 'new'
    end
  end
  def show
    @image= Image.find(params[:id])
	end
	private
	def image_params
    params.require(:image).permit(:image)
  end
end
