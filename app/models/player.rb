class Player < ActiveRecord::Base
	belongs_to :team
	has_many :performances
	has_many :heros, through: :performances
	has_many :matches, through: :performances
	has_many :items, through: :performances

	 def user
    id64 = self.id.to_i + 76561197960265728
    @user = User.find_by_uid(id64)
    if @user != nil
    	return @user
    end
    return User.new(name: "Unknown", logo: "unknown_user.png", mmr: "1000", email: "unknown@unknown.com", provider: "not_steam", uid: "0", first_pos: "carry", second_pos: "offlane", steam_profile: "http://steamcommunity.com", player_type: "player")
  end
end