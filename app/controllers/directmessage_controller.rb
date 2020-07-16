class DirectmessageController < ApplicationController
  before_action :authenticate_user!, :only => [:create,:destroy]

  def create
  	if Entry.where(:user_id => current_user.id, :room_id => params[:directmessage][:room_id]).present?
  		@directmessage = Directmessage.create(params.require(:directmessage).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
  		redirect_to request.referer
  	else
  		redirect_to tweets_path
  	end
  end

  def destroy
  	@directmessage = directmessage.find(params[:id])
   	if @directmessage.user_id == current_user.id
    	@directmessage.destroy
    	redirect_to request.referer
    end
  end

end