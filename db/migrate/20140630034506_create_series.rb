class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :series_type
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps
    end
  end
end
