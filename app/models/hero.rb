require 'json'
require 'frozen_record'

class Hero < FrozenRecord::Base
	self.base_path = 'data/'

	def self.all_by_picks
		hero_ranks = Hash.new
		Hero.all.each do |hero|
			hero_ranks[hero] = Match.num_picked(hero.hero_id)
		end
		hero_ranks.keys.sort_by {|e| hero_ranks[e] }.reverse!
	end

	def self.all_by_winrate
		hero_ranks = Hash.new
		Hero.all.each do |hero|
			hero_ranks[hero] = Match.win_percentage(hero.hero_id)
		end
		hero_ranks.keys.sort_by {|e| hero_ranks[e] }.reverse!
	end

	def self.all_by_bans
		hero_ranks = Hash.new
		Hero.all.each do |hero|
			hero_ranks[hero] = Match.num_banned(hero.hero_id)
		end
		hero_ranks.keys.sort_by {|e| hero_ranks[e] }.reverse!
	end

	def self.get_portrait_url(hid)
		url = find_by_hero_id(hid).portrait_url_small
		url
	end

	def portrait_url_large
		url = "http://cdn.dota2.com/apps/dota2/images/heroes/"+name+"_lg.png" 
		url
	end

	def portrait_url_small
		url = "http://cdn.dota2.com/apps/dota2/images/heroes/"+name+"_sb.png" 
		url
	end

	def to_param
		name.parameterize
	end

end
