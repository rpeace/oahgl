class Hero < ActiveRecord::Base
	has_many :performances
	has_many :matches, through: :performances
	has_many :teampicks, :class_name => Team, through: :picks, :source => :team
	has_many :teambans, :class_name => Team, through: :bans, :source => :team
	has_many :picks
	has_many :bans
end
