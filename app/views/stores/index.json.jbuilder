json.array!(@stores) do |store|
  json.extract! store, :id, :product_name, :brand_name, :cost, :description, :color, :feature_1, :feature_2
  json.url store_url(store, format: :json)
end
