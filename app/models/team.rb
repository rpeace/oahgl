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

	def upcoming_matches
		return FutureMatch.where(team1_id: self.id) + FutureMatch.where(team2_id: self.id)
	end

	def wins
		return Match.where(winner_id: self.id).length
	end

	def losses
		return Match.where(loser_id: self.id).length
	end

	def logo_path
		return "team_logo_"+self.team_id.to_s+".png"
	end
end
