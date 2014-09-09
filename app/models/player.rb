class Player < ActiveRecord::Base
	belongs_to :team
	has_many :performances
	has_many :heros, through: :performances
	has_many :matches, through: :performances
	has_many :items, through: :performances

	 def user
    # id64 = self.id.to_i + 76561197960265728
    # return User.find_by_uid(id64)
    return User.find_by_id(14)
  end
end