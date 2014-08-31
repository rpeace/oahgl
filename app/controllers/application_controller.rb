require 'open-uri'
require 'json'
require 'yaml'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user
	helper_method :user_steam_state
  helper_method :logged_in_as_user

  def logged_in_as_user(user)
    current_user != nil && user.id == current_user.id
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
