class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :item_id
      t.string :lname

      t.timestamps
    end
  end
end
