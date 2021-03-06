class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :address
      t.text :body
      t.references :user, foreign_key: true


      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
