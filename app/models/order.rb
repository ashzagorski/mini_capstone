class Order < ApplicationRecord
  belongs_to :user
  
  has_many :carted_products
  has_many :products, through: :carted_products



  def attach_cart
    user.cart.update_all(order_id: id, status: "purchased")
  end 
  
  def calculate_subtotal
    sum = 0
    carted_products.each do |carted_product|
      sum += carted_product.subtotal
    end 

    self.subtotal = sum
  end 

  def caluculate_tax
    self.tax = subtotal * 0.09
  end 

  def calculate_total
    self.total = subtotal + tax
  end 

  def build_totals
    attach_cart
    calculate_subtotal
    caluculate_tax
    calculate_total
  end
end
