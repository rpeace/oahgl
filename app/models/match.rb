class Match < FrozenRecord::Base

	self.base_path = 'data/'

	def to_param
		match_id.to_s.parameterize
	end
end
