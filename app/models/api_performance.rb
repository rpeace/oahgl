require 'json'
require 'frozen_record'

class Api_Performance < FrozenRecord::Base
	self.base_path = 'data/'

	def to_param
		performance_id.parameterize
	end
end
