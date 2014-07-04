class AddIsWinnerToPerformance < ActiveRecord::Migration
  def change
  	add_column :performances, :is_winner, :boolean
  end
end