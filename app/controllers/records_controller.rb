class RecordsController < ApplicationController
  
	def index
		@records = Record.all
	end

	def show
		@record = Record.find(params[:id])
		@users = @record.users.all
    @user_stack = current_user.lists.first
    @user_wants = current_user.lists.last
    @users_have = @record.lists.where(name:"have")
	end

	def new 
		@record = Record.new
	end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def patch
    @record = Record.find(params[:id])
    @record.update_attributes(record_params)
    redirect_to record_path(@record)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end


	private
	def record_params
		params.require(:record).permit(:artist,:title,:cover)
	end
end

