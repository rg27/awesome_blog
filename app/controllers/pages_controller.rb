class PagesController < ApplicationController
	def  home
	  #condition check if user is logged in, if login render "users/homefeed"
	  #homefeed=>Add homefeed.html.erb in Users Views, no need to put else
	  if logged_in?
			@post = current_user.posts.build
			@posts = current_user.posts.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
			render "users/homefeed"
	  end
	end

	def  about
		
	end

end
