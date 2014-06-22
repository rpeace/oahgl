require 'json'
require 'frozen_record'

class Hero < FrozenRecord::Base
	self.base_path = 'data/'

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

	def to_param
		name.parameterize
	end

end
