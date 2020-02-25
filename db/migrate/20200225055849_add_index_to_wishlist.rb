class AddIndexToWishlist < ActiveRecord::Migration[6.0]
  def change
    add_index :wishlists, [:user_id, :product_id], unique: true
  end
end
