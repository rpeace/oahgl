json.array!(@items) do |item|
  json.extract! item, :id, :name, :item_id, :lname
  json.url item_url(item, format: :json)
end
