class Directmessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy

  def create_notification_directmessage(current_user)
    direct_message = Directmessage.where(id: self.id)
    room = Room.find_by(id: direct_message.select(:room_id))
    user_find = room.entries
    entry_user = user_find.where.not(user_id: current_user.id)

    entry_user.each do |user|
  		notification = current_user.active_notifications.new(
        directmessage_id: self.id,
        room_id: room.id,
        passive_id: user.user_id,
        action: "directmessage"
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.passive_id == notification.active_id
         notification.checked = true
      end
      notification.save if notification.valid?
    end
 	end

  validates :directmessage, presence: true, length: { maximum: 200 }
end
