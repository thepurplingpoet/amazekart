class WishlistController < ApplicationController
  
  def index
    Product.uncached do
      @wishlist_products = Product.find(User.find(current_user.id).wishlists.pluck(:product_id))
    end
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

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlist_index_path, notice: 'Wishlist item removed' }
    end
  end

  private
  def wishlist_params
    params.require(:wishlist).permit(:user_id, :product_id)
  end
end
