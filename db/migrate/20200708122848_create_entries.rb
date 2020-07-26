class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.timestamps
    end
    add_reference :entries, :user, foreign_key: true
    add_reference :entries, :room, foreign_key: true
  end
end
