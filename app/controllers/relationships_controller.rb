class RelationshipsController < ApplicationController
	#when follow a user
	def create
		user = User.find(params[:id]).follower
		current_user.follow(user)
		flash[:succcess] = "Successfully followed #(user.name)"
		redirect_back(fallback_location: request.referer)
	end

	def destroy
		user = Relationship.find(params[:id]).followed
		current_user.unfollow(user)
		flash[:succcess] = "Successfully unfollowed #(user.name)"
		redirect_back(fallback_location: request.referer)
	end
end
