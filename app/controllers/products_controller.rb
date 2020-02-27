class ProductsController < ApplicationController

  USER_ID = "user_id"

  def show
    @product = Product.find(params[:id])
    if current_user
      @added_to_wishlist = Wishlist.find_by(user_id:current_user.id, product_id:@product.id)
    end
    @in_cart = product_in_cart?
  end
  
  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
 
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :stock, :discount).merge(user_id: current_user.id)
  end

  def show_by_seller(seller)
    
  end

  def product_in_cart?
    product_to_find = params[:id].to_s
    cart = JSON.parse(cookies[:cart])
    user_cart = cart[current_user.id.to_s]
    return if user_cart.nil?
    products = cart[current_user.id.to_s]["products"]
    products.include? product_to_find    
  end
end
