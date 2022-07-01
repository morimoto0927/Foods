class AddMenuToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :menu, :string
    add_column :posts, :price, :string
  end
end
