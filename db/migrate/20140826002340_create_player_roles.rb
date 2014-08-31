class CreatePlayerRoles < ActiveRecord::Migration
  def change
    create_table :player_roles do |t|
    	t.string :player_id
      t.string :team_id
      t.string :role

      t.timestamps
    end
  end
end