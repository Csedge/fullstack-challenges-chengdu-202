class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.references :post, foreign_key: true
      t.timestamps null: false
    end
  end
end
