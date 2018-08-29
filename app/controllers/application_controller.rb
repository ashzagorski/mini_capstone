class ApplicationController < ActionController::Base
  def products_action
    @products = Product.all
    render 'products.json.jbuilder'
  end 

  def product_action
  end 
end
