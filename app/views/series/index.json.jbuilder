json.array!(@series) do |series|
  json.extract! series, :id, :series_type, :winner_id, :loser_id
  json.url series_url(series, format: :json)
end
