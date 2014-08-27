class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def show
	end

	def new
		if current_user
			@user = User.find(current_user)
			@post = Post.find(params[:post_id])
			@comment = Comment.new
		else
			redirect_to new_user_session
		end
	end

	def edit
	end

	def create
		@post = Post.find(params[:post_id])
		@user = current_user
		@comment = @post.comments.new(comment_params)
		@comment.user = @user
		if @comment.save
			redirect_to post_path(@post)
		else 
			render 'new'
		end
	end

	def update
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_to :back
	end

private

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:text)
	end
end
