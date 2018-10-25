class ImageCommentController < ApplicationController
	def new
		@image_comment = Image_comment.new
	end
end
