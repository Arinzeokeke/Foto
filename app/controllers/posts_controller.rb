class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to posts_path
		end
		
	end

	private

	def post_params
		params.require(:post).permit(:image, :caption)
 	end
end
