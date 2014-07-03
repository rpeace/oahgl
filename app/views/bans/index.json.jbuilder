json.array!(@bans) do |ban|
  json.extract! ban, :id, :order, :match_id, :hero_id, :team_id
  json.url ban_url(ban, format: :json)
end
