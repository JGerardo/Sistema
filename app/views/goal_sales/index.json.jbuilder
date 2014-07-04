json.array!(@goal_sales) do |goal_sale|
  json.extract! goal_sale, :id, :user_id, :meta, :reached, :fechainicio, :fechafin
  json.url goal_sale_url(goal_sale, format: :json)
end
