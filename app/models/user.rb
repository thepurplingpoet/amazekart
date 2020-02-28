class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :wishlists

  def seller_details
    if self.seller?
      order_items = OrderItem.eager_load(:product).select { |item| item.product.user_id == self.id }
      revenue = order_items.inject(0) { |x, y| x + (y.quantity * y.price) }.to_f
      products = Product.all.select {|product| product.user_id == self.id}
      {
        sold_items: order_items,
        total_revenue: revenue,
        products: products,
      }
    end
  end

  
         
end
