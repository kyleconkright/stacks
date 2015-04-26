class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@have_list = List.create(name:"have")
		@want_list = List.create(name:"want")
		@user.lists << @have_list
		@user.lists << @want_list
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

	def edit
		@user = User.find(params[:id])
	end

	def update
	  @user = User.find(params[:id])

	  if @user.update(user_params)
	    flash[:message] = "User profile successfully updated!"
	    redirect_to users_path
	  else
	    render :edit
	  end
	end

	def destroy
	  @user = User.find(params[:id])
		@user_lists = List.where(user_id:@user.id)
	  @user_lists.destroy_all
	  @user.destroy
	  session.delete(:user_id)
    redirect_to root_path
	end



	private
	def user_params
		params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
	end
	
end
