json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :user_id, :client_id, :descripcion, :acuerdo, :medio
  json.url promotion_url(promotion, format: :json)
end
