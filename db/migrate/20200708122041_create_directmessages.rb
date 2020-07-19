class CreateDirectmessages < ActiveRecord::Migration[5.2]
   def change
    create_table :directmessages do |t|
      # t.references :user, type: :bigint, foreign_key: true
      # t.references :room, type: :bigint, foreign_key: true
      t.text :directmessage, null: false

      t.timestamps
    end
	add_reference :directmessages, :user, foreign_key: true
	add_reference :directmessages, :room, foreign_key: true
  end
end
