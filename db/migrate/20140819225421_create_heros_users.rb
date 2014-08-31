class CreateHerosUsers < ActiveRecord::Migration
  def change
    create_table :heros_users do |t|
   	  t.belongs_to :heros
      t.belongs_to :users
      t.string :user_id
      t.string :hero_id
      t.timestamps
    end
  end
end
