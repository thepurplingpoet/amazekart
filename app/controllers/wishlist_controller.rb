class WishlistController < ApplicationController
  
  def index
    @wishlist_products = Product.find_by_sql("SELECT * FROM products
    JOIN wishlists ON products.id = wishlists.product_id
    where wishlists.user_id = #{current_user.id}")
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    begin
      @wishlist.save
    rescue
      
    ensure
      redirect_to Product.find(@wishlist.product_id)
    end
  end

  private
  def wishlist_params
    params.require(:wishlist).permit(:user_id, :product_id)
  end
end
