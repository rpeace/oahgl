class CreateFutureMatches < ActiveRecord::Migration
  def change
    create_table :future_matches do |t|
    	t.datetime :time
    	t.integer :team1_id
    	t.integer :team2_id
    end
  end
end
