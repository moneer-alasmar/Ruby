class SessionsController < ApplicationController
    def new
        # render login page
    end
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
    	session[:user_id] = @user.id
    	redirect_to @user
      else
    	flash[:errors] = ["Invalid Combination!"]
    	redirect_to :back
      end
    end
    def destroy
    	reset_session
    	redirect_to :root
        # Log User out
        # set session[:user_id] to null
        # redirect to login page
    end


end