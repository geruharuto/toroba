class NotificationsController < ApplicationController
  def index
  	@notifications = current_user.passive_notifications
  	@notifications.where(checked: false).each do |notification|
  		notification.update_attributes(checked: true)
  	end
  end

  def destroy_all #通知を消さずに残す。ビューで色分けで既読通知かどうか判定と迷う
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to users_notifications_path
  end
end
