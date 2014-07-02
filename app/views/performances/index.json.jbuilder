json.array!(@performances) do |performance|
  json.extract! performance, :id, :performance_id, :level, :kills, :deaths, :assists, :last_hits, :denies, :gpm, :xpm, :hero_damage, :tower_damage, :hero_healing
  json.url performance_url(performance, format: :json)
end
