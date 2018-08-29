Rails.application.routes.draw do
  namespace :api do
    get '/products_url' => 'products#products_action'
    get '/product_url' => 'products#product_action'
  end
end
