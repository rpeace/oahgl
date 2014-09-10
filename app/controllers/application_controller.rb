require 'open-uri'
require 'json'
require 'yaml'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :users_on_same_team
  helper_method :players_on_same_team
	helper_method :current_user
	helper_method :user_steam_state
  helper_method :logged_in_as_user
  helper_method :authenticate_admin_user!
  helper_method :current_admin_user

  def authenticate_admin_user!
    if current_user != nil
      if current_user.uid == "76561197970031959"
        return true
      end
    end
    return false
  end

  def players_on_same_team(p1, p2)
    t1 = p1.team
    t2 = p2.team
    if t1 == t2 and t1 != nil and t2 != nil
      return true
    else
      return false
    end
  end

  def users_on_same_team(user1, user2)
    p1 = get_player_for_user(user1)
    p2 = get_player_for_user(user2)
    if p1 != nil and p2 != nil
      return on_same_team(p1, p2)
    else
      return false
    end
  end

  def get_player_for_user(user)
    # id32 = user.uid.to_i - 76561197960265728
    # return Player.find_by_id(id32)
    return Player.find_by_id(120214727)
  end

  def logged_in_as_user(user)
    current_user != nil && user.id == current_user.id
  end

  def current_admin_user
    return current_user
  end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def user_steam_state(user)
		profile_url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key="+ENV["STEAM_WEB_API_KEY"]+"&steamids="+user.uid
  	page = open(profile_url).read
  	json = JSON.parse(page)
  	state = json['response']['players'][0]['personastate']
  	if state == 0
  		return "Offline"
  	elsif state == 1
  		return "Online"
  	elsif state == 2
  		return "Busy"
  	elsif state == 3
  		return "Away"
  	elsif state == 4
  		return "Snooze"
  	elsif state == 5
  		return "Looking to trade"
  	elsif state == 6
  		return "Looking to play"
  	end
  end

end
