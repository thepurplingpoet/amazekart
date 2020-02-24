class ProductsController < ApplicationController

  USER_ID = "user_id"

  def show
    @product = Product.find(params[:id])
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
end
