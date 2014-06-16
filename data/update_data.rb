require 'open-uri'
require 'json'
require 'yaml'


league_id = "600"
p "Pulling data for league " + league_id.to_s
steam_key = "14DECACD2740DB8213B5DA8438E301C5"
outFile = File.open("match_history.yml", "w")
match_ids = []

p "Reading first Match History list..."
page = open("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?league_id=600&key="+steam_key).read
sleep(1)
json = JSON.parse(page)
json['result']['matches'].each do |match|
	match_ids << match['match_id']
end
outFile.write(page)

while json['result']['results_remaining'] > 0 do
	next_match_id = match_ids[-1] - 1
	p "Reading next Match History list..."
	page = open("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?league_id=600&start_at_match_id="+next_match_id.to_s+"&key="+steam_key).read
	sleep(1)
	json = JSON.parse(page)
	json['result']['matches'].each do |match|
		match_ids << match['match_id']
	end
end

outFile.write(page)
outFile.close()

outFile = File.open("match_id_list.json", "w")
match_ids.each do |match_id|
	outFile.write(match_id.to_s + "\n")
end
outFile.close()

match_ids.each do |match_id|
	unless File.file?("matches/"+match_id.to_s+".json")
	  p "Reading next Match Detail file..."
	 	page = open("https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?match_id="+match_id.to_s+"&key="+steam_key).read
		sleep(1)
		outFile = File.open("matches/"+match_id.to_s+".json", "w")
		outFile.write(page)
		outFile.close()
	end
end