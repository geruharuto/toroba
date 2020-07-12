class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notification, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :tweet, presence: true, length: { maximum: 200 }
end
