json.array!(@providers) do |provider|
  json.extract! provider, :id, :nombreempesa, :telefono, :e_mail, :direccion
  json.url provider_url(provider, format: :json)
end
