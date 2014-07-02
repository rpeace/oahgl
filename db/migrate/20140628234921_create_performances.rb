class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :performance_id
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
