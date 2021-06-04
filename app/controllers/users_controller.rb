class UsersController < ApplicationController
	before_action :logged_in_user, except: [:new, :create]
	before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Successfully Created a account."
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Successfully Updated Profile."
			redirect_to root_url
		else
			render 'edit'
		end
    end
	
	def show
		@user = User.find(params[:id])
		@posts = @user.posts.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def correct_user
			user = User.find(params[:id])
			if user != current_user
				flash[:danger] = "You are not authorized"
				redirect_to root_url
			end
		end
end

