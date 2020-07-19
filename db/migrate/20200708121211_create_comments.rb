class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      # t.references :user, type: :bigint, foreign_key: true
      # t.references :tweet, type: :bigint, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end

    add_reference :comments, :user, foreign_key: true
  end
end
