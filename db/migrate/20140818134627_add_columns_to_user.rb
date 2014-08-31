class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_pos, :string
  	add_column :users, :second_pos, :string
  end
end
