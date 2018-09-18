class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :orders, optional: true
end
