class Category < ApplicationRecord
  belongs_to :vertical
  has_many :products
end
