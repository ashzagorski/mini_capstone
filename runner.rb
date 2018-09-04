require 'HTTP'

#index
response = HTTP.get("http://localhost:3000/api/products")

p response.parse #to see body


#create

puts "Enter an ID number:"

id = gets.chomp.to_i

puts "And a new name:"

name = gets.chomp

puts "And a new price:"

price = gets.chomp.to_i

puts "And an image URL:"

image_url = gets.chomp

puts "And a description"

description = gets.chomp

HTTP.patch("http://localhost:3000/api/products/#{id}", form: {name: name, price: price, image_url: image_url, description: description})

#show
print "enter product number:"
product_id = gets.chomp
response = HTTP.get("http://localhost:3000/api/prodcuts/#{product_id}")
p response.parse


#update
puts "Enter product id you would like to update:"
id = gets.chomp.to_i






#destroy