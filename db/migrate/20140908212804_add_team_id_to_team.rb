class AddTeamIdToTeam < ActiveRecord::Migration
  def change
  	add_column :teams, :team_id, :string
  end
end
