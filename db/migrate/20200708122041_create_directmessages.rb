# frozen_string_literal: true

class CreateDirectmessages < ActiveRecord::Migration[5.2]
  def change
    create_table :directmessages do |t|
      t.text :directmessage, null: false

      t.timestamps
    end
    add_reference :directmessages, :user, foreign_key: true
    add_reference :directmessages, :room, foreign_key: true
 end
end
