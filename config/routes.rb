Rails.application.routes.draw do
  namespace :api do
    get '/all_products_url' => 'products#all_products_action'
    get '/product_url' => 'products#product_action'
  end
end
