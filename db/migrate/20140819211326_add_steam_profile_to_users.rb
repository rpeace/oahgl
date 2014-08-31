class AddSteamProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :steam_profile, :string
  end
end
