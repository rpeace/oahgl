class RemoveOldApiTables < ActiveRecord::Migration
  def change
  	drop_table :api_heros
  	drop_table :api_items
  	drop_table :api_matches
  	drop_table :api_performances
  	drop_table :api_series
  end
end
