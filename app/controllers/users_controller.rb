class UsersController < ApplicationController
	protect_from_forgery
	before_action :verify_login, only: [:show, :index]

	def home
	end

	def verify_login
		if !current_user
			if params[:user] && params[:user][:email] && params[:user][:password]
				@user = User.authenticate(params[:user][:email], params[:user][:password])
			end
			if @user
				session[:user_id] = @user.id
				redirect_to users_url, :notice => "Logged in!"
			else
				flash.now.alert = "Invalid email or password" if params[:user]
				render "verify_login"
			end
		end
	end

	def new
	end

	def index
	end

	def show
	end
end
