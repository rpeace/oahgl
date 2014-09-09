class User < ActiveRecord::Base

	has_and_belongs_to_many :heros

	POSITIONS = ['carry', 'mid', 'offlane', 'support']
  PLAYER_TYPES = ['captain', 'player']

	# validates_inclusion_of :first_pos, :in => POSITIONS
	# validates_inclusion_of :second_pos, :in => POSITIONS

  def player
    # id32 = self.uid.to_i - 76561197960265728
    # return Player.find_by_id(id32)
    return Player.find_by_id(30600683)
  end
	# before_create :save_steam_fields
  def save_steam_fields(session)
    self.logo = session[:steam_logo]
  	self.name = session[:steam_name]
  	self.uid = session[:steam_uid]
   	self.provider = session[:provider]
   	self.steam_profile = session[:steam_profile]
  end
end
