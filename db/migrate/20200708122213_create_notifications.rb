class CreateNotifications < ActiveRecord::Migration[5.2]
   def change
    create_table :notifications do |t|
      t.references :active, null: false, type: :bigint, foreign_key: { to_table: :users }
      t.references :passive, null: false, type: :bigint, foreign_key: { to_table: :users }
      t.references :directmessage, foregin_key: true, type: :bigint
      t.references :room, foregin_key: true, type: :bigint
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    add_reference :notifications, :comment, foreign_key: true
  end
end
