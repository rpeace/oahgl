require 'open-uri'
require 'json'
require 'yaml'

steam_key = "14DECACD2740DB8213B5DA8438E301C5"

teamyml = YAML.load_file("teams.yml")
teamyml.keys.each do |teamkey|
	print "%%%%%%%%%%ACQUIRING LOGO FOR TEAM "+teamkey
	logo = teamyml[teamkey]['logo']
	content = open("http://api.steampowered.com/ISteamRemoteStorage/GetUGCFileDetails/v1/?key="+steam_key.to_s+"&appid=570&ugcid="+logo.to_s).read
	sleep(1)
	json = JSON.parse(content)
	system("wget "+json['data']['url'])
	system("mv index.html ../../app/assets/images/team_logo_"+teamkey.to_s[1,teamkey.length]+".png")
	sleep(1)
end