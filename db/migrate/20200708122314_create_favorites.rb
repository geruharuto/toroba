# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, &:timestamps
    add_reference :favorites, :user, foreign_key: true
    add_reference :favorites, :comment, foreign_key: true
  end
end
