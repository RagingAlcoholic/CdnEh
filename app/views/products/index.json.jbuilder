json.array!(@products) do |product|
  json.extract! product, :id, :sku, :name, :price, :description, :image, :stock, :lastUpdated, :categoryID
  json.url product_url(product, format: :json)
end
