class ApplicationController < ActionController::Base
  def all_products_action
    @products = Product.all
    render 'all_products_view.json.jbuilder'
  end 

  def product_action
    render 'product.json.jbuilder'
  end 
end
