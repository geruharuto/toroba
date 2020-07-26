# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follower_id])
    follow = current_user.active_relationships.build(follower_id: user.id)
    follow.save!
    # 通知の作成
    user.create_notification_follow(current_user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:follower_id])
    follow = current_user.active_relationships.find_by(follower_id: user.id)
    follow.destroy!
    redirect_to request.referer
  end
end
