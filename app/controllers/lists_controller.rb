class ListsController < ApplicationController
  def index
    
  end

  def update
  	@list = List.find(params[:id])
  	@record = Record.find(params[:list][:record_id])
  	@user_stack = current_user.lists.first.records
  	@user_wants = current_user.lists.last.records
  	
  	if @list.id == 1
	  	unless @user_stack.exists?(@record)
	  		@list.records << @record
	  	else
	  		@list.records.delete(@record)
	  	end
	elsif @list.id == 2
		unless @user_wants.exists?(@record)
			@list.records << @record
		else
			@list.records.delete(@record)
		end
	end

  	
  	if @list.save
  		redirect_to record_path(@record)
  	end
  end

end
