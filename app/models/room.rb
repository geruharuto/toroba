# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :directmessages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
