class RelationshipsController < ApplicationController
	#when follow a user
	def create
		#need follower_id and followed_id
		Relationship.create(
			follower_id: current_user.id,
			followed_id: params[:followed_id]
		)
		#	redirect_back
		redirect_back(fallback_location: request.referer)
	end


	def destroy
		Relationship.find_by(follower_id: current_user.id,
			followed_id: params[:followed_id]).destroy
			
		redirect_back(fallback_location: request.referer)
	end
end
