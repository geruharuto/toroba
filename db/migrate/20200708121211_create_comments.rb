# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, null: false

      t.timestamps
    end

    add_reference :comments, :user, foreign_key: true
  end
end
