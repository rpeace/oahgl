require 'json'
require 'frozen_record'

class Item < FrozenRecord::Base

	self.base_path = 'data/'

	

	def get_portrait_url_large
		url = "http://cdn.dota2.com/apps/dota2/images/items/"+name+"_lg.png" 
		url
	end

	def to_param
		name.parameterize
	end

end
