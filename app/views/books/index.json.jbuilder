json.array!(@books) do |book|
  json.extract! book, :id, :isbn, :titulo, :autor, :editorial, :precio, :cantidad, :category_id
  json.url book_url(book, format: :json)
end
