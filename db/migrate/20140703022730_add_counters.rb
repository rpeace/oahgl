class AddCounters < ActiveRecord::Migration
  def change
  	add_column :heros, :bans_count, :integer, :default => 0
  	add_column :teams, :bans_count, :integer, :default => 0
  	add_column :heros, :picks_count, :integer, :default => 0
  	add_column :teams, :picks_count, :integer, :default => 0
  end
end
