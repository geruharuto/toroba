class CreateDirectmessages < ActiveRecord::Migration[5.2]
  def change
    create_table :directmessages do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.references :room, type: :bigint, foreign_key: true
      t.text :directmessage, null: false

      t.timestamps
    end
  end
end
