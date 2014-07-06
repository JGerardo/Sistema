json.array!(@clients) do |client|
  json.extract! client, :id, :nombre, :telefono, :direccion, :e_mail, :facebook, :twitter, :liked_in
  json.url client_url(client, format: :json)
end
