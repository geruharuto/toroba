class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :following, type: :bigint, foreign_key: true
      t.references :follower, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end
