class ApplicationController < ActionController::Base
	include SessionsHelper

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please login first"
			redirect_to login_url
		end
	end
end
