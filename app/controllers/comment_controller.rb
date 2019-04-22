class CommentController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comments = @post.comment.create(comment_params)

		redirect_to post_path(@post)


	end
	private
	def comment_params
		params.require(:comment).permit(:name, :body)
	end
end