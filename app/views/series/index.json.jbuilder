json.array!(@series) do |series|
  json.extract! series, :id, :series_id, :series_type, :matches
  json.url series_url(series, format: :json)
end
