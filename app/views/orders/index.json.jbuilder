json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :client_id, :fechaPedido, :fechaEntrega, :fechaRealEntrega, :estado
  json.url order_url(order, format: :json)
end
