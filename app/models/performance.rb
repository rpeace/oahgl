require 'json'
require 'frozen_record'

class Performance < FrozenRecord::Base
	self.base_path = 'data/'

	def to_param
		performance_id.parameterize
	end
end
