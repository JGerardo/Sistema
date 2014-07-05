json.array!(@sale_details) do |sale_detail|
  json.extract! sale_detail, :id, :sale_id, :book_id, :cantidad, :precio, :descuento, :total
  json.url sale_detail_url(sale_detail, format: :json)
end
