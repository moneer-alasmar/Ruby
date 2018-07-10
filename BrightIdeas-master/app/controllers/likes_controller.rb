class LikesController < ApplicationController
  def create
	@like = Like.new(idea_id: params[:idea_id], user: current_user)
	  if @like.save
	  	@user = User.find(session[:user_id])
		  redirect_to :back
	  else
		  flash[:errors] = @like.errors.full_messages
		  redirect_to :back
	  end
  end
  def destroy
    @like = Like.find(params[:id]).destroy
    redirect_to :back
  end
end