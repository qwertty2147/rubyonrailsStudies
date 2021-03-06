class PostsController < ApplicationController
	before_action :find_post, only: [:show , :edit , :update , :destroy]

	def index
		if session[:gSession] == "a"
			@posts = Post.all.order("created_at DESC")
		else
			redirect_to logins_path
		end
		
	end

	def new
		@post = Post.new
	end


	def create
		@post = Post.new(post_params)
			if @post.save
				flash[:notice] = "Post successful"
				redirect_to post_path(@post)
			else 
				render :new
			end
	end


	def show

	end

	def edit

	end


	def update
		
		if @post.update(post_params)
			flash[:notice] = "Update successful"
			redirect_to post_path(@post)
		else 
			render :edit
		end
	end

	def destroy
		
		@post.destroy
		flash[:notice] = "Delete successful"
		redirect_to posts_path
		
	end
	

	private

	def find_post
		@post = Post.find(params[:id])	
		
	end

	
	def post_params
		params.require(:post).permit(:title, :body)
		
	end
end
