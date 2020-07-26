class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  belongs_to :comment, optional: :true

  validates_uniqueness_of :tweet_id, scope: :user_id
end
