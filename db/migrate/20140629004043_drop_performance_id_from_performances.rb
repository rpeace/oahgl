class DropPerformanceIdFromPerformances < ActiveRecord::Migration
def up
    remove_column :performances, :performance_id
  end

  def down
    add_column :performances, :performance_id, :string
  end
end
