class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.string :lname
      t.integer :hero_id

      t.timestamps
    end
  end
end
