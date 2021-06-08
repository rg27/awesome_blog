class RelationshipsController < ApplicationController
	#when follow a user
	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
		flash[:success] = "Successfully followed #{@user.name}"
		redirect_back(fallback_location: request.referer)
	end

	def destroy
		user = Relationship.find(params[:id]).followed
		current_user.unfollow(user)
		flash[:success] = "Successfully unfollowed #{user.name}"
		redirect_back(fallback_location: request.referer)
	end
end
