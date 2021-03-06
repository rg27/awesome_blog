class PostsController < ApplicationController
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Successfully Created!"
		else
			flash[:danger] = "Please input content"
		end
		redirect_back(fallback_location: request.referer)
	end

	def destroy
		@post = Post.find(params[:id])
    	@post.destroy
		redirect_back(fallback_location: request.referer)
	end

	private
		def post_params
			params.require(:post).permit(:content, :image)
		end
end
