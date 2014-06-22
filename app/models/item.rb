require 'json'
require 'frozen_record'

class Item < FrozenRecord::Base

	def self.get_portrait_url(iid)
		url = find_by_item_id(iid).get_portrait_url_large
		url
	end

	self.base_path = 'data/'

	def get_portrait_url_large
		if item_id != "0"
			if name.include? "recipe"
				url = "http://cdn.dota2.com/apps/dota2/images/items/recipe_lg.png"
			else
				url = "http://cdn.dota2.com/apps/dota2/images/items/"+name+"_lg.png"
			end
		else
			url = "http://cdn.dota2.com/apps/dota2/images/items/blink_lg.png"
		end
		url
	end

	def to_param
		name.parameterize
	end

end
