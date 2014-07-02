class Match < ActiveRecord::Base
	has_many :performances
	belongs_to :series
	belongs_to :winner, :class_name => Team, inverse_of: :matches_won, foreign_key: "winner_id"
	belongs_to :loser, :class_name => Team, inverse_of: :matches_lost, foreign_key: "loser_id"
end
