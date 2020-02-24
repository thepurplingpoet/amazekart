class PagesController < ApplicationController
  def home
    @products = Product.all
    @verticals = Vertical.all
    @top_products = Product.all[0..5]
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
