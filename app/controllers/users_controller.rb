class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		@user_stack = @user.lists.first.records.all
		@user_wants = @user.lists.last.records.all
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
	end
end
