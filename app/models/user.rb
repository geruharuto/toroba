# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  attachment :profile_image

  has_many :entries
  has_many :directmmessages
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'active_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'passive_id', dependent: :destroy

  # フォローする側から見てフォローされる側のUser
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following

  # フォローされた時の通知
  def create_notification_follow(current_user)
    temp = Notification.where(['active_id = ? and passive_id = ? and action = ?', current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        active_id: current_user.id,
        passive_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def unchecked_notifications
    passive_notifications.where(checked: false)
  end

  validates :name, length: { maximum: 20, minimum: 2 }
  validates :introduction, length: { maximum: 200 }
end
