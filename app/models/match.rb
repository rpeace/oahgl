class Match < FrozenRecord::Base

	self.base_path = 'data/'

	def self.num_picked(hid)
		numPicks = 0
		Match.all.each do |match|
			if match.was_picked(hid)
				numPicks += 1
			end
		end
		numPicks
	end

	def self.num_banned(hid)
		numBans = 0
		Match.all.each do |match|
			if match.was_banned(hid)
				numBans += 1
			end
		end
		numBans
	end

	def self.hero_pick_rank(hid)
		rank = 1
		numPicked = Match.num_picked(hid)
		Hero.all.each do |hero|
			if Match.num_picked(hero.hero_id) > numPicked
				rank += 1
			end
		end
		rank
	end

	def self.hero_ban_rank(hid)
		rank = 1
		numBanned = Match.num_banned(hid)
		Hero.all.each do |hero|
			if Match.num_banned(hero.hero_id) > numBanned
				rank += 1
			end
		end
		rank
	end

	def self.num_won(hid)
		numWon = 0
		Match.all.each do |match|
			if match.won_game(hid)
				numWon += 1
			end
		end
		numWon
	end

	def self.num_lost(hid)
		numLost = 0
		Match.all.each do |match|
			if match.lost_game(hid)
				numLost += 1
			end
		end
		numLost
	end

	def self.win_percentage(hid)
		numPicked = num_picked(hid) 
		if numPicked == 0
			return 0.0
		end
		100.0 * num_won(hid) / numPicked
	end

	def winning_team
		if winner == "dire"
			return dire_team_id
		else
			return radiant_team_id
		end
	end

	def won_game(hid)
		if [r_pick_0,r_pick_1,r_pick_2,r_pick_3,r_pick_4].include? hid and winner=='radiant'
			return true
		end
		if [d_pick_0,d_pick_1,d_pick_2,d_pick_3,d_pick_4].include? hid and winner=='dire'
			return true
		end
		return false
	end

	def lost_game(hid)
		if [r_pick_0,r_pick_1,r_pick_2,r_pick_3,r_pick_4].include? hid and winner=='dire'
			return true
		end
		if [d_pick_0,d_pick_1,d_pick_2,d_pick_3,d_pick_4].include? hid and winner=='radiant'
			return true
		end
		return false
	end

	def was_picked(hid)
		if [r_pick_0,r_pick_1,r_pick_2,r_pick_3,r_pick_4,d_pick_0,d_pick_1,d_pick_2,d_pick_3,d_pick_4].include? hid
			return true
		end
		return false
	end

	def was_banned(hid)
		if [r_ban_0,r_ban_1,r_ban_2,r_ban_3,r_ban_4,d_ban_0,d_ban_1,d_ban_2,d_ban_3,d_ban_4].include? hid
			return true
		end
		return false
	end

	def to_param
		match_id.to_s.parameterize
	end
end
