json.array!(@picks) do |pick|
  json.extract! pick, :id, :order, :match_id, :hero_id, :team_id
  json.url pick_url(pick, format: :json)
end
