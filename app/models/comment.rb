class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :notification, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :tweet, presence: true, length: { maximum: 200 }
end