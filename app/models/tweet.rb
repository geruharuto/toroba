# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # いいねされた時の通知
  def create_notification_favorite!(current_user)
    temp = Notification.where(['active_id = ? and passive_id = ? and tweet_id =? and action = ?', current_user.id, user_id, id, 'favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        tweet_id: id,
        passive_id: user_id,
        action: 'favorite'
      )
      if notification.active_id == notification.passive_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメントされた時の通知
  def create_notification_comment(current_user, comment_id)
    # 自分以外のコメントuserを取得、通知
    temp_ids = Comment.select(:user_id).where(tweet_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      notification = current_user.active_notifications.new(
        tweet_id: id,
        comment_id: comment_id,
        passive_id: temp_id.user_id,
        action: 'comment'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.passive_id == notification.active_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
   end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :tweet, presence: true, length: { maximum: 200 }
end
