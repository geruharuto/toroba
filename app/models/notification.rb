# frozen_string_literal: true

class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :tweet, optional: true
  belongs_to :comment, optional: true
  belongs_to :directmessage, optional: true
  belongs_to :room, optional: true
  belongs_to :active, class_name: 'user', foreign_key: 'active_id', optional: true
  belongs_to :passive, class_name: 'user', foreign_key: 'passive_id', optional: true
end
