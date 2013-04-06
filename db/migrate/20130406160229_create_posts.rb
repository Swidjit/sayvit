class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_id
      t.timestamp :post_time
      t.string :title

      t.timestamps
    end
  end
end
