class Hero < ActiveRecord::Base
	has_many :performances
	has_many :matches, through: :performances
end
