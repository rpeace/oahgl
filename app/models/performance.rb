class Performance < ActiveRecord::Base
	belongs_to :player
	belongs_to :hero
	belongs_to :match
	has_and_belongs_to_many :items
end