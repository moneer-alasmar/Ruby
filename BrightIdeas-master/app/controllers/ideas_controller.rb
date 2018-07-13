class IdeasController < ApplicationController
	def index
  	@user = User.find(session[:user_id])
		@ideas = Idea.all
		@randomIdea = Idea.all.shuffle.first
  end
  def show
  	@user = current_user
  	@idea = Idea.find(params[:id])
  end
  def create
	@idea = Idea.new(content: params[:content], user: current_user)
	  if @idea.save
	  	@user = User.find(session[:user_id])
		  redirect_to :back
	  else
		  flash[:errors] = @idea.errors.full_messages
		  redirect_to :back
	  end
  end
  def destroy
    @idea = Idea.find(params[:id]).destroy
    redirect_to :back
  end
end


