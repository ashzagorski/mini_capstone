json.id tea.id
json.name tea.name
json.description tea.description
json.price tea.price
json.tax tea.tax
json.total tea.total
json.discounted tea.is_discounted?

json.formatted do 
  json.price number_to_currency(tea.price)
  json.tax number_to_currency(tea.tax)
  json.total number_to_currency(tea.total)
 end 

if tea.is_discounted?
  json.sale_message "Dicounted Price"
end 

json.supplier do
  json.partial! tea.supplier, partial: 'api/suppliers/supplier', as: :supplier
end 

json.image do
  json.partial! tea.image, partial: 'api/images/image', as: :image
end 