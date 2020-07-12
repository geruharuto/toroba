class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :tweet, foreign_key: true
      t.references :following, foreign_key: true
      t.references :follower, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
