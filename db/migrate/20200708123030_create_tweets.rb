# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :tweet, null: false
      t.string :listener, null: false
      t.string :genre, null: false

      t.timestamps
    end

    add_reference :tweets, :user, foreign_key: true
    add_reference :comments, :tweet, foreign_key: true
    add_reference :favorites, :tweet, foreign_key: true
    add_reference :notifications, :tweet, foreign_key: true
 end
end
