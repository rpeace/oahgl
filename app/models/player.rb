class Player < ActiveRecord::Base
	belongs_to :team
	has_many :performances
	has_many :heros, through: :performances
	has_many :matches, through: :performances
	has_many :items, through: :performances
end