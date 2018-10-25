class CommentsController < ApplicationController
	before_action :set_post, only: [:new, :create,:index,:show]
	def new
		@comment=Comment.new
		@comments=Post.last.comments.order(created_at: :desc)
	end
	def  create
		@comment = @post.comments.build(comment_params)
		p @comment
			if @comment.save
	 			redirect_to  new_post_comment_path(@post) ,notice: 'Hello friends'
			else
				render 'new' ,notice: @comment.errors.full_messages.join(', ')
			end
	end
	private
		def set_post
			@post= Post.find(params[:post_id])
		end

		def comment_params
			params.require(:comment).permit(:name,:body)
		end
end
