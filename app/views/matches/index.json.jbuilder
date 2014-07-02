json.array!(@matches) do |match|
  json.extract! match, :id, :match_id, :radiant_win, :start_time, :duration
  json.url match_url(match, format: :json)
end
