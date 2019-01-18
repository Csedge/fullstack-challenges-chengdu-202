class AddVotesToPosts < ActiveRecord::Migration[5.2]
  def change
    # TODO: your code here to create the posts table
    add_column :posts, :votes, :integer, default: 0, null: false
  end
end
