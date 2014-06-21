json.array!(@performances) do |performance|
  json.extract! performance, :id, :performance_id, :hero_id, :item_0, :item_1, :item_2, :item_3, :item_4, :item_5, :level, :kills, :deaths, :assists, :last_hits, :denies, :gpm, :xpm, :hero_damage, :tower_damage, :hero_healing
  json.url performance_url(performance, format: :json)
end
