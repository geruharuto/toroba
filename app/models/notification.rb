class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}

  belongs_to :tweet_id, optional: true, dependent: :destroy
  belongs_to :follower_id, class_name: 'User', foreign_key: 'follower_id', optional: true
  belongs_to :comment_id, optional: true, dependent: :destroy
end