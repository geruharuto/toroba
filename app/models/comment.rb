class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :notification, dependent: :destroy

  def create_notification_by(current_user)
  	notification = current_user.active_notifications.new(
        tweet_id: id,
        passive_id: user_id,
        action: "create"
        )
  end

  def create_notification_comment!(current_user, commment_id)
  	#自分以外のコメントuserを取得、通知
  	temp_ids = Comment.select(:user_id).where(tweet_id).wher.not(user_id: current_user.id).distinct
  	temp_ids.each do |temp_id|
  		save_notification_comment!(current_user, comment_id, temp_id["user_id"])
  	end
  # まだ誰もコメントしていない場合は、投稿者通知　必要か要確認
        save_notification_comment!(current_user, comment_id, user_id) 
        if temp_ids.blank?
    	end

   def save_notification_comment!(current_user, comment_id, passive_id)
   	# コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
    	tweet_id: id,
        comment_id: comment_id,
        passive_id: passive_id,
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