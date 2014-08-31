class HerosPlayers < ActiveRecord::Base
	belongs_to :heros
	belongs_to :players
end
