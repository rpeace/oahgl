json.array!(@items) do |item|
  json.extract! item, :id, :item_id, :name, :lname
  json.url item_url(item, format: :json)
end
