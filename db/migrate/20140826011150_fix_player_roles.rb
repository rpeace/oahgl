class FixPlayerRoles < ActiveRecord::Migration
  def change
  	remove_column :player_roles, :player_id
  	add_column :player_roles, :user_id, :string
  end
end
