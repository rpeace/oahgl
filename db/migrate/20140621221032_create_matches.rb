class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :match_id
      t.string :winner
      t.string :duration
      t.string :radiant_team_id
      t.string :dire_team_id
      t.string :player_0_id
      t.string :player_1_id
      t.string :player_2_id
      t.string :player_3_id
      t.string :player_4_id
      t.string :player_5_id
      t.string :player_6_id
      t.string :player_7_id
      t.string :player_8_id
      t.string :player_9_id
      t.string :first_pick
      t.string :ap_remake
      t.string :d_ban_0
      t.string :r_ban_0
      t.string :d_ban_1
      t.string :r_ban_1
      t.string :d_pick_0
      t.string :r_pick_0
      t.string :r_pick_1
      t.string :d_pick_1
      t.string :d_ban_2
      t.string :r_ban_2
      t.string :d_ban_3
      t.string :r_ban_3
      t.string :r_pick_2
      t.string :d_pick_2
      t.string :r_pick_3
      t.string :d_pick_3
      t.string :r_ban_4
      t.string :d_ban_4
      t.string :r_pick_4
      t.string :d_pick_4

      t.timestamps
    end
  end
end
