class Product < ApplicationRecord
  belongs_to :user
  belongs_to :order_item
  belongs_to :order
  has_many :wishlists
  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {minimum: 5}
  validates :stock, presence: true, numericality: {only_integer: true, greater_than: -1}
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0}
end
