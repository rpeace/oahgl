class Pick < ActiveRecord::Base
	belongs_to :hero
	belongs_to :match
	belongs_to :team
end