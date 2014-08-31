class Hero < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :performances
	has_many :matches, through: :performances
	has_many :picked_by, :class_name => Team, through: :picks, :source => :team
	has_many :banned_by, :class_name => Team, through: :bans, :source => :team
	has_many :picks
	has_many :bans

	def small_portrait_url
		"http://cdn.dota2.com/apps/dota2/images/heroes/"+self.name+"_sb.png"
	end

	def self.hero_names
		hnames = Array.new
		Hero.select(:lname).each do |hero|
			hnames.push(hero.lname)
		end
		return hnames.sort
	end
end
