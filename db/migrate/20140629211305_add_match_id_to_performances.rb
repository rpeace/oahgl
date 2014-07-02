class AddMatchIdToPerformances < ActiveRecord::Migration
  def change
  	add_column :performances, :match_id, :integer
  end
end
