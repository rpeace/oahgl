class SupportBigIntsInSteamUiDs < ActiveRecord::Migration
  def change
  	change_column :users, :uid, 'integer USING CAST(uid AS integer)', :limit => 8
  end
end
