class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :performance_id
      t.string :hero_id
      t.string :item_0
      t.string :item_1
      t.string :item_2
      t.string :item_3
      t.string :item_4
      t.string :item_5
      t.integer :level
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.integer :last_hits
      t.integer :denies
      t.integer :gpm
      t.integer :xpm
      t.integer :hero_damage
      t.integer :tower_damage
      t.integer :hero_healing

      t.timestamps
    end
  end
end
