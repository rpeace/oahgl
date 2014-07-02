class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :hero_id
      t.string :name
      t.string :lname

      t.timestamps
    end
  end
end
