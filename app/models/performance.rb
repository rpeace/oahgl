require 'json'
require 'frozen_record'

class Performance < FrozenRecord::Base
	self.base_path = 'data/'

	def get_hero_portrait_url
		url = Hero.find_by_hero_id(hero_id).get_portrait_url_small
		url
	end

	def get_item_portrait_url(iid)
		url = Item.find_by_item_id(iid).get_portrait_url_large
		url
	end

	def to_param
		performance_id.parameterize
	end
end
