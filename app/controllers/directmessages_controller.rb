class DirectmessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create,:destroy]

  def create
  	if Entry.where(:user_id => current_user.id, :room_id => params[:directmessage][:room_id]).present?
  		@directmessage = Directmessage.create(directmessage_params)
  		redirect_to request.referer
  	else
  		redirect_to tweets_path
  	end
  end

  def destroy
  	@directmessage = directmessage.find(params[:directmessage_id])
    @directmessage.destroy
    redirect_to request.referer
  end

  private
  def directmessage_params
    params.require(:directmessage).permit(:user_id, :directmessage, :room_id).merge(:user_id => current_user.id)
  end

end