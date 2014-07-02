class AddPerformanceIdToItemsPerformances < ActiveRecord::Migration
  def change
  	add_column :items_performances, :performance_id, :integer
  end
end
