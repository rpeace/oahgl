class RenameTables < ActiveRecord::Migration
  def change
  	  rename_table :items, :api_items
      rename_table :heros, :api_heros
      rename_table :matches, :api_matches
      rename_table :series, :api_series
      rename_table :performances, :api_performances
  end
end
