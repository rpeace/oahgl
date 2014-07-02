class AddHeroIdToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :hero_id, :integer
  end
end
