require 'http'

#index
response = HTTP.get("http://localhost:3000/api/products")

p response.parse #to see body

#show
print "enter product number:"
product_id = gets.chomp
response = HTTP.get("http://localhost:3000/api/prodcuts/#{product_id}")
p response

#create
print "Add new tea product, input tea name:"
tea_name = gets.chomp

print "input tea description:"
tea_description = gets.chomp

print "Add product image:"
image_url = gets.chomp

tea = Product.new(
                  name: tea_name,  
                  description: tea_description, 
                  image_url: image_url
                  )

response = HTTP.get("http://localhost:3000/api/prodcuts/")
p response.parse

