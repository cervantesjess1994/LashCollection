class CreateLashPosts < ActiveRecord::Migration
  def change
    create_table :lash_posts do |t|
      t.string :name
      t.string :brand
      t.string :style
      t.string :comments
    end
  end
end
