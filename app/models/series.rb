class Series < ActiveRecord::Base
	has_many :matches
	belongs_to :winner, :class_name => Team, inverse_of: :series_won, foreign_key: "winner_id"
	belongs_to :loser, :class_name => Team, inverse_of: :series_lost, foreign_key: "loser_id"
end
