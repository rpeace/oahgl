class Team < ActiveRecord::Base
	has_many :matches_won, :class_name => Match, inverse_of: :winner, foreign_key: "winner_id"
	has_many :matches_lost, :class_name => Match, inverse_of: :loser, foreign_key: "loser_id"
	has_many :series_won, :class_name => Series, inverse_of: :winner, foreign_key: "winner_id"
	has_many :series_lost, :class_name => Series, inverse_of: :loser, foreign_key: "loser_id"
	has_many :players
end
