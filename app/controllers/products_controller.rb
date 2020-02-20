class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end
  def new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
 
  @product.save
  redirect_to @product
  end

  private
  def product_params
    params.require(:product).permit(:name, :description)
  end

  def show_by_seller(seller)
    
  end
end
