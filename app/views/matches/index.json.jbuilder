json.array!(@matches) do |match|
  json.extract! match, :id, :match_id, :winner, :duration, :radiant_team_id, :dire_team_id, :player_0_id, :player_1_id, :player_2_id, :player_3_id, :player_4_id, :player_5_id, :player_6_id, :player_7_id, :player_8_id, :player_9_id, :first_pick, :ap_remake, :d_ban_0, :r_ban_0, :d_ban_1, :r_ban_1, :d_pick_0, :r_pick_0, :r_pick_1, :d_pick_1, :d_ban_2, :r_ban_2, :d_ban_3, :r_ban_3, :r_pick_2, :d_pick_2, :r_pick_3, :d_pick_3, :r_ban_4, :d_ban_4, :r_pick_4, :d_pick_4
  json.url match_url(match, format: :json)
end
