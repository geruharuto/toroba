class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(following_id: params[:user_id])
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = current_user.active_relationships.find_by(following_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end
end
