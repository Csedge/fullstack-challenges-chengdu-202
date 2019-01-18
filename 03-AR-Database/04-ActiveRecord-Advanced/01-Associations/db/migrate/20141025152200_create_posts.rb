class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.integer :votes
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
