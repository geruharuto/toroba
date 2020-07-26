# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  belongs_to :comment, optional: :true

  validates :tweet_id, uniqueness: { scope: :user_id }
end
