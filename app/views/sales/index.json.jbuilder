json.array!(@sales) do |sale|
  json.extract! sale, :id, :client_id, :fecha, :user_id
  json.url sale_url(sale, format: :json)
end
