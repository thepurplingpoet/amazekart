class CartController < ApplicationController

  def add
    cart = JSON.parse(cookies[:cart])
  
    user_cart = cart[current_user.id.to_s]

    if user_cart.nil?
      cart[current_user.id.to_s] = {"products" => []}
    end

    products = cart[current_user.id.to_s]["products"]
    if products.nil?
      products = []
    end

    products = products << cart_params[:product_id].to_s
    cart[current_user.id.to_s] = {
      products: products
    }
    cookies[:cart] = JSON.generate(cart)
    redirect_to Product.find(cart_params[:product_id])
  end

  

  def remove
    cart = JSON.parse(cookies[:cart])
    
    user_cart = cart[current_user.id.to_s]
    products = cart[current_user.id.to_s]["products"]
    products.delete(cart_params[:product_id].to_s)
    cart[current_user.id.to_s] = {
      products: products
    }
    cookies[:cart] = JSON.generate(cart)
    redirect_to pages_cart_path(current_user.id), method: :get
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id)
    end

end
