class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :series_id
      t.string :series_type
      t.text :matches

      t.timestamps
    end
  end
end
