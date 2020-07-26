# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :following, type: :bigint, foreign_key: { to_table: :users }
      t.references :follower, type: :bigint, foreign_key: { to_table: :users }

      t.timestamps
    end
 end
end
