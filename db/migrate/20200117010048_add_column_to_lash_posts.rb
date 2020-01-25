class AddColumnToLashPosts < ActiveRecord::Migration
  def change
    add_column :lash_posts, :user_id, :integer
  end
end
