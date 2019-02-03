class UsersController < ApplicationController
	protect_from_forgery
	before_action :verify_login, only: [:show, :index]

	def home
	end

	def new
		@user = UserCustomer.new
	end

	def create
		@user = UserCustomer.new(user_params)
		if @user.save
			#For now sending mail to single employee
			#We can loop email and send mail to all employees and can run it as delayed Job
			#NotificationMailer.notification_mailer(@employee).deliver
			redirect_to login_path, :notice => "You successfully Signed up, Please login to continue!"
		else
			flash.now.alert = "Email Already Taken" 
			render 'new'
		end
	end

	def show
		@user = UserCustomer.find(params[:id])
	end

	def index
		@user = UserCustomer.all
	end

	def verify_login
		if !current_user
			if params[:user] && params[:user][:email] && params[:user][:password]
				@user = User.authenticate(params[:user][:email], params[:user][:password])
			end
			if @user
				session[:user_id] = @user.id
				redirect_to airplanes_url, :notice => "Logged in!"
			else
				flash.now.alert = "Invalid email or password" if params[:user]
				render "verify_login"
			end
		end
	end

	def destroy_login
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
