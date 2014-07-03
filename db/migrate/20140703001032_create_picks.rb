class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :order
      t.integer :match_id
      t.integer :hero_id
      t.integer :team_id

      t.timestamps
    end
  end
end
