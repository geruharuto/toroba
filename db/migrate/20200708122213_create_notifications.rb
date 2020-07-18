class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      # t.references :tweet, type: :bigint, foreign_key: true
      t.references :active, type: :bigint, foreign_key: { to_table: :users }
      t.references :passive, type: :bigint, foreign_key: { to_table: :users }
      # t.references :comment, type: :bigint, foreign_key: true
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    # add_reference :notifications, :active, foreign_key: true
    # add_reference :notifications, :passive, foreign_key: true
    add_reference :notifications, :comment, foreign_key: true
  end
end
