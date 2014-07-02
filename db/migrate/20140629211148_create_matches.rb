class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :match_id
      t.boolean :radiant_win
      t.string :start_time
      t.string :duration

      t.timestamps
    end
  end
end
