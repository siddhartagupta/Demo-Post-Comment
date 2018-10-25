class PostsController < ApplicationController
	before_action :find_post, only: [:show,:edit,:update]
	def index
		@post=Post.all.order(created_at: :desc)

	end
	def new
		@post= Post.new
	end
	def create
		@post= current_user.posts.build(post_params)
			if @post.save
				flash[:success] = "The post was created!"
	 			redirect_to @post ,notice: 'Hello friends'
			else
				render 'new' ,notice: @post.errors.full_messages.join(', ')
			end
	end
	def show
		
	end
	def edit
	end
	def update
		if @post.update post_params
			redirect_to @post ,notice: 'this is for the updating the post'
		else
			render 'edit'
		end
	end
	def destroy
	 	@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
	def find_post
		@post =Post.find(params[:id])
	end
	private
		def post_params
				params.require(:post).permit(:title,:content)
		end
end
