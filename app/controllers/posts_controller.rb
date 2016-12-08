class PostsController < ApplicationController

	before_action :set_post , only: [:show, :edit, :update, :destroy, :like]
	before_action :authenticate_user!
	before_action :owned_post, only: [:edit, :update, :destroy]
	

	def index
		@posts = Post.of_followed_users(current_user.following).order('created_at DESC').page params[:page]
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Your post has been created!"
			redirect_to posts_path
		else
			flash[:alert] = "Your new post couldn't be created!
			Please check the form."
			render :new
		end
	end

	def browse
		@posts = Post.all.order('created_at DESC').page params[:page]
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

	def like
		if current_user.voted_for? @post
			@post.unliked_by current_user
			delete_notification(@post)
		else
			@post.liked_by current_user
			create_notification(@post)
			
		end
		#puts "im here"

		respond_to do |format|
      		format.html { redirect_to :back}
      		format.js
    	end
	end

	private
	def delete_notification(post)
    	unless current_user.id == post.user_id
      		notification = Notification.all.where(:notification_type => "like", :user_id => post.user_id, :op_user_id => current_user.id, :post_id => post.id)

      		notification.last.destroy
    end
  end
	def create_notification(post)
    	unless current_user.id == post.user_id
      		notification = Notification.new(:user_id => post.user_id, :op_user_id => current_user.id, :notification_type => "like", :post_id => post.id)
      		notification.save
    	end
  	end

	def post_params
		params.require(:post).permit(:avatar, :caption)
 	end

 	def set_post
 		@post = Post.find(params[:id])
 	end

 	def voter_list
 		@voters = @post.votes_for.voters

 	end

 	def owned_post
		unless current_user == @post.user
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to root_path
		end
	end
end
