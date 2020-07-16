class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.text :tweet, null: false
      t.integer :listener, default: 0, null: false
      t.integer :genre, default: 0, null: false

      t.timestamps
    end
  end
end
