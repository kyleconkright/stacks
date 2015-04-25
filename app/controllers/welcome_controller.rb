class WelcomeController < ApplicationController
  


  def index
    if logged_in?
    	redirect_to user_path(current_user)
    end
  end

  private 
  def logged_in?
    session[:user_id] != nil
  end
end
