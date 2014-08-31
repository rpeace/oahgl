class Team < ActiveRecord::Base
	has_many :matches_won, :class_name => Match, inverse_of: :winner, foreign_key: "winner_id"
	has_many :matches_lost, :class_name => Match, inverse_of: :loser, foreign_key: "loser_id"
	has_many :series_won, :class_name => Series, inverse_of: :winner, foreign_key: "winner_id"
	has_many :series_lost, :class_name => Series, inverse_of: :loser, foreign_key: "loser_id"
	has_many :heropicks, :class_name => Hero, through: :picks
	has_many :herobans, :class_name => Hero, through: :bans
	has_many :players
	has_many :picks
	has_many :bans

	has_many :player_roles
	has_many :users, through: :player_roles
end
