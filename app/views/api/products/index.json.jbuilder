json.array! @teas.each do |tea|
  json.id tea.id
  json.name tea.name
  json.description tea.description
  json.image_url tea.image_url
  json.link "http://localhost:3000/api/products/#{tea.id}"
end 