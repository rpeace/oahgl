require 'frozen_record'

class Series < FrozenRecord::Base

	self.base_path = 'data/'

	def self.teams_by_wins
		team_score = Hash.new
		Series.all.each do |series|
			if team_score.keys.include?series.winner
				team_score[series.winner][0] += 1
			else
				team_score[series.winner] = [1,0]
			end
			if team_score.keys.include?series.loser
				team_score[series.loser][1] += 1
			else
				team_score[series.loser] = [0,1]
			end
		end
		team_score.keys.sort_by {|e| [team_score[e][0], 999-team_score[e][1]] }.reverse!
	end

	def self.num_wins(team_id)
		numWins = 0
		Series.all.each do |series|
			if series.winner == team_id
				numWins += 1
			end
		end
		numWins
	end

	def self.num_losses(team_id)
		numLosses = 0
		Series.all.each do |series|
			if series.loser == team_id
				numLosses += 1
			end
		end
		numLosses
	end

	def match_list
		mlist = []
		matches.each do |match|
			mlist.push(match)
		end
		return mlist
	end

	def winner
		team_1_wins = 0
		team_2_wins = 0
		match_list.each do |match_id|
			match = Match.find_by_match_id(match_id)
			if team_1_id == match.winning_team
				team_1_wins += 1
			else
				team_2_wins += 1
			end
		end
		if team_1_wins > team_2_wins
			return team_1_id
		else
			return team_2_id
		end
	end

	def loser
		team_1_wins = 0
		team_2_wins = 0
		match_list.each do |match_id|
			match = Match.find_by_match_id(match_id)
			if team_1_id == match.winning_team
				team_1_wins += 1
			else
				team_2_wins += 1
			end
		end
		if team_1_wins < team_2_wins
			return team_1_id
		else
			return team_2_id
		end
	end

	def to_param
		series_id.to_s.parameterize
	end

end
