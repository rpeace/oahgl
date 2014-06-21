require 'open-uri'
require 'json'
require 'yaml'

league_id = "600"
p "Pulling data for league " + league_id.to_s
steam_key = "14DECACD2740DB8213B5DA8438E301C5"
outFile = File.open("match_history.json", "w")
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
		# Save JSON to a JSON data file
		outFile = File.open("matches/"+match_id.to_s+".json", "w")
		outFile.write(page)
		outFile.close()
	end
end

outFile = File.open("performances.yml","w")
match_ids.each do |match_id|
	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)
	json['result']['players'].each do |p|
		outFile.write("- performance_id: "+match_id.to_s+"-"+p['account_id'].to_s+"\n")
		outFile.write("  player_id: "+p['account_id'].to_s+"\n")
		outFile.write("  hero_id: "+p['hero_id'].to_s+"\n")
		outFile.write("  item_0: "+p['item_0'].to_s+"\n")
		outFile.write("  item_1: "+p['item_1'].to_s+"\n")
		outFile.write("  item_2: "+p['item_2'].to_s+"\n")
		outFile.write("  item_3: "+p['item_3'].to_s+"\n")
		outFile.write("  item_4: "+p['item_4'].to_s+"\n")
		outFile.write("  item_5: "+p['item_5'].to_s+"\n")
		outFile.write("  level: "+p['level'].to_s+"\n")
		outFile.write("  kills: "+p['kills'].to_s+"\n")
		outFile.write("  deaths: "+p['deaths'].to_s+"\n")
		outFile.write("  assists: "+p['assists'].to_s+"\n")
		outFile.write("  last_hits: "+p['last_hits'].to_s+"\n")
		outFile.write("  denies: "+p['denies'].to_s+"\n")
		outFile.write("  gpm: "+p['gold_per_min'].to_s+"\n")
		outFile.write("  xpm: "+p['xp_per_min'].to_s+"\n")
		outFile.write("  hero_damage: "+p['hero_damage'].to_s+"\n")
		outFile.write("  tower_damage: "+p['tower_damage'].to_s+"\n")
		outFile.write("  hero_healing: "+p['hero_healing'].to_s+"\n")
	end
end
outFile.close()

outFile = File.open("abilitybuilds.yml","w")
match_ids.each do |match_id|
	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)
	json['result']['players'].each do |p|
		outFile.write("- build_id: "+match_id.to_s+"-"+p['account_id'].to_s+"\n")
		for i in 1..p['ability_upgrades'].size
			outFile.write("  ability_"+i.to_s+"_id: "+p['ability_upgrades'][i-1]['ability'].to_s+"\n")
			outFile.write("  ability_"+i.to_s+"_time: "+p['ability_upgrades'][i-1]['time'].to_s+"\n")
		end
		for i in p['ability_upgrades'].size+1..25
			outFile.write("  ability_"+i.to_s+"_id: NA"+"\n")
			outFile.write("  ability_"+i.to_s+"_time: NA"+"\n")
		end
	end
end
outFile.close()