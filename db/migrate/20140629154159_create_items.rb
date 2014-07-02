class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_id
      t.string :name
      t.string :lname

      t.timestamps
    end
  end
end
