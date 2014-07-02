class CreateItemsPerformances < ActiveRecord::Migration
  def change
    create_table :items_performances, id: false do |t|
      t.belongs_to :items
      t.belongs_to :performances
    end
  end
end
