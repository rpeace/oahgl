require 'json'
require 'frozen_record'

class Hero < FrozenRecord::Base
	self.base_path = 'data/'

	def self.get_num_played(hid)
		Performance.where(hero_id: hid).size
	end

	def self.get_rank(hid)
		rank = 1
		numPlayed = Performance.where(hero_id: hid).size
		Hero.all.each do |hero|
			if Performance.where(hero_id: hero.hero_id).size > numPlayed
				rank += 1
			end
		end
		rank
	end

	def self.get_portrait_url(hid)
		url = find_by_hero_id(hid).get_portrait_url_small
		url
	end

	def get_portrait_url_large
		url = "http://cdn.dota2.com/apps/dota2/images/heroes/"+name+"_lg.png" 
		url
	end

	def get_portrait_url_small
		url = "http://cdn.dota2.com/apps/dota2/images/heroes/"+name+"_sb.png" 
		url
	end

	def num_played
		Performance.where(hero_id: hero_id).size
	end

	def hero_rank
		rank = 1
		numPlayed = num_played
		Hero.all.each do |hero|
			if Performance.where(hero_id: hero.hero_id).size > numPlayed
				rank += 1
			end
		end
		rank
	end

	def to_param
		name.parameterize
	end

end
