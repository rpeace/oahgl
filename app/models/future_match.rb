class FutureMatch < ActiveRecord::Base

	def team1
		return Team.find(team1_id)
	end

	def team2
		return Team.find(team2_id)
	end

end