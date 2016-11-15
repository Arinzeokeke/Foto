class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			flash[:success] = "Your post has been created!"
			redirect_to posts_path
		else
			flash.now[:alert] = "Your new post couldn't be created! Please check the form."
			render("new")
		end
		
	end

	def show
		
	end

	def edit

	end

	def update
		
		if @post.update_attributes(post_params)
      		flash[:success] = "Your post has been updated!"
      		redirect_to  post_path(@post.id)
    	else
    		flash.now[:alert] = "Your new post couldn't be updated! Please check the form."
      		render('edit')
      	end
    end

    def destroy
    	@post.destroy
    	flash[:success] = "Your post has been deleted"
    	redirect_to  posts_path
    	else

    end

	private

	def post_params
		params.require(:post).permit(:avatar, :caption)
 	end

 	def set_post
 		@post = Post.find(params[:id])
 	end
end
