class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  def new
  end

  def show
  	@user = User.find(params[:id])
  	@idea = Idea.all
  end
  def create
	  @user = User.new(user_params)
	  if @user.save
	  	session[:user_id] = @user.id
		  redirect_to @user
	  else
		  flash[:errors] = @user.errors.full_messages
		  redirect_to :back
	  end
  end
    def edit
    	@user = User.find(session[:user_id])
    end

    def update
    	@user = User.find(session[:user_id])
	    if @user.update(user_params)
	      redirect_to @user
	    else
	    flash[:errors] = @user.errors.full_messages
	    redirect_to :back
	    end
    end
    def destroy
    @user = User.find(params[:id]).destroy
    reset_session
    redirect_to "users/new"
  	end
  private
  def user_params
    params.require(:user).permit(:name, :email, :alias, :password, :password_confirmation)
  end
end


