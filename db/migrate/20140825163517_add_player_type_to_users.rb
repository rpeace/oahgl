class AddPlayerTypeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :player_type, :string
  end
end
