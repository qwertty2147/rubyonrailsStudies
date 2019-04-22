class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comment.create(comment_params)

		flash[:notice] = "comment has nemm "
		redirect_to post_path(@post)

	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comment.find(params[:id])
		@comment.destroy
		flash[:notice] = "comment has been destroyed "
		redirect_to post_path(@post)

	end

	private
	def comment_params
		params.require(:comment).permit(:name, :body)
	end
end
