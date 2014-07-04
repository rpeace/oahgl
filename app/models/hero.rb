class Hero < ActiveRecord::Base
	has_many :performances
	has_many :matches, through: :performances
	has_many :picked_by, :class_name => Team, through: :picks, :source => :team
	has_many :banned_by, :class_name => Team, through: :bans, :source => :team
	has_many :picks
	has_many :bans
end
