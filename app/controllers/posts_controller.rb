class PostsController < ApplicationController
	before_action :find_post,only: [:show , :edit , :update , :destroy]
	def index
		@posts = Post.all
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
		 @post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
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

	def find_post
		@post = Post.find(params[:id])	
		
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
		
	end
end
