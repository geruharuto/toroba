class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, type: :bigint, foreign_key: true
      t.references :tweet, type: :bigint, foreign_key: true
      t.references :comment, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end
