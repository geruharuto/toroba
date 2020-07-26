class DirectmessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create,:destroy]

  def create
    @room_find = Room.find(params[:directmessage][:room_id])
    @user_find = @room_find.entries
    @entry_user = @user_find.where.not(user_id: current_user.id)
    @opponent_user = @entry_user.first.user
  	if Entry.where(:user_id => current_user.id, :room_id => params[:directmessage][:room_id]).present?
  		@directmessage = Directmessage.create(directmessage_params)
      @directmessage.create_notification_directmessage(current_user)
  		redirect_to request.referer
  	else
  		redirect_to root_path
  	end
  end

  private
  def directmessage_params
    params.require(:directmessage).permit(:user_id, :directmessage, :room_id).merge(:user_id => current_user.id)
  end

end