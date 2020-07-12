class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  belongs_to :comment

  validates_uniqueness_of :tweet_id, :comment_id, scope: :user_id
end
