class PostsController < ApplicationController
	
	def index
    	@posts = Post.all.reverse
    	@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.reverse
	end

	def new
		@user = current_user
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = 'Post was successfully created.'
			redirect_to posts_path
		else
			render 'new'
		end
	end


	def edit
		@post = Post.find(params[:id])
		@user = current_user
		@comment = Comment.find(params[:id])
	end

	def update
	    @post = Post.find(params[:id])
	    if @post.update(post_params)
	      flash[:notice] = 'Post was successfully updated.'
	      redirect_to post_path(@post)
	    else
	      render 'edit'
	    end
	end

	def destroy
    @post = Post.find(params[:id])
    if (@post.user == current_user)
      @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
	 	end
	end

private
 
	def post_params
    params.require(:post).permit(:title, :caption)
	end
	
end
