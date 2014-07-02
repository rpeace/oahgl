class AddItemIdToItemsPerformances < ActiveRecord::Migration
  def change
  	add_column :items_performances, :item_id, :integer
  end
end
