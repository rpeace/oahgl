require 'open-uri'
require 'json'
require 'yaml'

league_id = "600"
p "Pulling data for league " + league_id.to_s
steam_key = "14DECACD2740DB8213B5DA8438E301C5"
match_ids = []

heroNames = {}
heroJson = JSON.parse(File.open("heros.json").read)
heroJson['result']['heroes'].each do |hero|
	heroNames[hero['id']] = hero['name'][14..-1]
end

items = YAML.load_file("api_items.yml")
itemNames = {}
items.each do |item|
	itemNames[item['item_id']] = item['name']
end

# Read in match history from GetMatchHistory API calls
# Write to match_history.json and save match IDs to match_ids array
p "Reading first Match History list..."
page = open("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?league_id=600&key="+steam_key).read
sleep(1)
json = JSON.parse(page)
while JSON.parse(page)['result']['results_remaining'] > 0 do
	next_match_id = json['result']['matches'][-1]['match_id'] - 1
	p "Reading next Match History list..."
	page = open("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?league_id=600&start_at_match_id="+next_match_id.to_s+"&key="+steam_key).read
	sleep(1)
	json['result']['matches'] += JSON.parse(page)['result']['matches']
end
json['result']['matches'].each do |match|
	match_ids << match['match_id']
end
outFile = File.open("match_history.json", "w")
outFile.write(JSON.pretty_generate(json))
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


playerToTeam = {}
# Build the Performances fixture, and log some player/team combos while we're at it...
outFile = File.open("../db/seeds/performances.yml","w")
heroPerformances = {}
heroNames.keys.each do |id|
	heroPerformances[id] = []
end
itemPerformances = {}
itemNames.keys.each do |id|
	itemPerformances[id] = []
end
p heroPerformances.keys
match_ids.each do |match_id|
	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)
	# Log player/team combos
	json['result']['players'][0..4].each do |p|
		playerToTeam[p['account_id']] = json['result']['radiant_team_id']
	end
	json['result']['players'][5..9].each do |p|
		playerToTeam[p['account_id']] = json['result']['dire_team_id']
	end
	# And now fill out the performance fixture.
	json['result']['players'].each do |p|
		performance_id = "m"+match_id.to_s+"_"+"p"+p['account_id'].to_s
		heroPerformances[p['hero_id']].push(performance_id)
		itemPerformances[p['item_0']].push(performance_id)
		itemPerformances[p['item_1']].push(performance_id)
		itemPerformances[p['item_2']].push(performance_id)
		itemPerformances[p['item_3']].push(performance_id)
		itemPerformances[p['item_4']].push(performance_id)
		itemPerformances[p['item_5']].push(performance_id)
		outFile.write(performance_id+":\n")
		if p['player_slot'] < 5
			outFile.write("  is_winner: "+json['result']['radiant_win'].to_s+"\n")
		else
			outFile.write("  is_winner: "+(!json['result']['radiant_win']).to_s+"\n")
		end
		outFile.write("  player: p"+p['account_id'].to_s+"\n")
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
		outFile.write("  hero: "+heroNames[p['hero_id']]+"\n")
		outFile.write("  match: m"+match_id.to_s+"\n")
		outFile.write("  items: ")
		outFile.write(itemNames[p['item_0']]+", ")
		outFile.write(itemNames[p['item_1']]+", ")
		outFile.write(itemNames[p['item_2']]+", ")
		outFile.write(itemNames[p['item_3']]+", ")
		outFile.write(itemNames[p['item_4']]+", ")
		outFile.write(itemNames[p['item_5']]+"\n")
	end
end
# itemPerformances.keys.each do |key|
# 	itemPerformances[key] = itemPerformances[key].uniq
# end
outFile.close()


# Build the Items fixture
outFile = File.open("../db/seeds/items.yml","w")
items.each do |item|
	outFile.write(item['name']+":\n")
	outFile.write("  name: "+item['name']+"\n")
	outFile.write("  lname: "+item['lname']+"\n")
	outFile.write("  item_id: "+item['item_id'].to_s+"\n")
	# outFile.write("  performances: "+itemPerformances[item['item_id']] * ", " + "\n")
end

# Build the Heros fixture
outFile = File.open("../db/seeds/heros.yml","w")
json = JSON.parse(File.open("heros.json").read)['result']['heroes']
json.each do |hero|
	outFile.write(hero['name'][14..-1]+":\n")
	outFile.write("  name: "+hero['name'][14..-1]+"\n")
	outFile.write("  lname: "+hero['localized_name']+"\n")
	outFile.write("  hero_id: "+hero['id'].to_s+"\n")
	# outFile.write("  performances: "+heroPerformances[hero['id']] * ", " + "\n")
end

# Build the Series fixture
outFile = File.open("../db/seeds/series.yml", "w")
matches = JSON.parse(File.open("match_history.json").read)['result']['matches']
matchToSeries = {}
last_series = 0
unique_series_id = 1
series_match_ids = []
matches.each do |match|
	current_series = match['series_id']
	if current_series != last_series or current_series == 0
		if not series_match_ids.empty?
			match_json = JSON.parse(File.open("matches/"+series_match_ids[0].to_s+".json").read)
			if match_json['result']['radiant_win']
				outFile.write("  winner: t"+match_json['result']['radiant_team_id'].to_s+"\n")
				outFile.write("  loser: t"+match_json['result']['dire_team_id'].to_s+"\n")
			else
				outFile.write("  winner: t"+match_json['result']['dire_team_id'].to_s+"\n")
				outFile.write("  loser: t"+match_json['result']['radiant_team_id'].to_s+"\n")
			end
			series_match_ids = []
		end
		outFile.write("s"+unique_series_id.to_s+":\n")
		unique_series_id += 1
		outFile.write("  series_type: "+match['series_type'].to_s+"\n")
	end
	matchToSeries[match['match_id']] = "s"+(unique_series_id-1).to_s
	series_match_ids.push(match['match_id'])
	last_series = current_series
end
match_json = JSON.parse(File.open("matches/"+series_match_ids[0].to_s+".json").read)
outFile.write("  winner: t"+match_json['result']['radiant_team_id'].to_s+"\n")
outFile.write("  loser: t"+match_json['result']['dire_team_id'].to_s+"\n")
outFile.close()

# Build the Matches fixture
outFile = File.open("../db/seeds/matches.yml","w")
match_ids.each do |match_id|
	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)['result']
	outFile.write("m"+match_id.to_s+":\n")
	outFile.write("  match_id: "+match_id.to_s+"\n")
	outFile.write("  radiant_win: "+json['radiant_win'].to_s+"\n")
	outFile.write("  start_time: "+json['start_time'].to_s+"\n")
	outFile.write("  duration: "+json['duration'].to_s+"\n")
	if json['radiant_win'] == "true"
		outFile.write("  winner: t"+json['radiant_team_id'].to_s+"\n")
		outFile.write("  loser: t"+json['dire_team_id'].to_s+"\n")
	else
		outFile.write("  winner: t"+json['dire_team_id'].to_s+"\n")
		outFile.write("  loser: t"+json['radiant_team_id'].to_s+"\n")
	end
	outFile.write("  series: "+matchToSeries[match_id].to_s+"\n")
	# outFile.write("  performances: ")
	# json['players'].each do |p|
	# 	outFile.write("m"+match_id.to_s+"_"+"p"+p['account_id'].to_s)
	# end
	# outFile.write("  radiant_team_id: "+json['radiant_team_id'].to_s+"\n")
	# outFile.write("  dire_team_id: "+json['dire_team_id'].to_s+"\n")
	# for i in 0..9
	# 	outFile.write("  player_"+i.to_s+"_id: "+json['players'][i]['account_id'].to_s+"\n")
	# end
	# if json['game_mode'] == 2
	# 	if json['picks_bans'][0]['team'] == 1
	# 		outFile.write("  first_pick: dire\n")
	# 	else
	# 		outFile.write("  first_pick: radiant\n")
	# 	end
	# 	outFile.write("  ap_remake: false\n")
	# 	dp = 0
	# 	rp = 0
	# 	db = 0
	# 	rb = 0
	# 	json['picks_bans'].each do |pick|
	# 		if pick['is_pick'] == true
	# 			if pick['team'] == 0
	# 				outFile.write("  r_pick_"+rp.to_s+": "+pick['hero_id'].to_s+"\n")
	# 				rp += 1
	# 			else
	# 				outFile.write("  d_pick_"+dp.to_s+": "+pick['hero_id'].to_s+"\n")
	# 				dp += 1
	# 			end
	# 		else
	# 			if pick['team'] == 0
	# 				outFile.write("  r_ban_"+rb.to_s+": "+pick['hero_id'].to_s+"\n")
	# 				rb += 1
	# 			else
	# 				outFile.write("  d_ban_"+db.to_s+": "+pick['hero_id'].to_s+"\n")
	# 				db += 1
	# 			end
	# 		end
	# 	end
	# 	while db <= 4
	# 		outFile.write("  d_ban_"+db.to_s+": NA\n")
	# 		db += 1
	# 	end
	# 	while rb <= 4
	# 		outFile.write("  r_ban_"+rb.to_s+": NA\n")
	# 		rb += 1
	# 	end
	# else
	# 	outFile.write("  ap_remake: true\n")
	# 	for i in 0..4
	# 		outFile.write("  r_pick_"+rp.to_s+": NA\n")
	# 		outFile.write("  d_pick_"+rp.to_s+": NA\n")
	# 		outFile.write("  r_ban_"+rp.to_s+": NA\n")
	# 		outFile.write("  d_ban_"+rp.to_s+": NA\n")
	# 	end
	# end
end
outFile.close()

# Build the Teams fixture
outFile = File.open("../db/seeds/teams.yml","w")
teams = {}
match_ids.each do |match_id|
	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)
	teamData = []
	teamData.push(json['result']['radiant_name'])
	teamData.push(json['result']['radiant_logo'])
	teams["t"+json['result']['radiant_team_id'].to_s] = teamData
	teamData = []
	teamData.push(json['result']['dire_name'])
	teamData.push(json['result']['dire_logo'])
	teams["t"+json['result']['dire_team_id'].to_s] = teamData
end
teams.keys.each do |team_id|
	outFile.write(team_id + ":\n")
	outFile.write("  name: "+teams[team_id][0].to_s+"\n")
	outFile.write("  logo: "+teams[team_id][1].to_s+"\n")
end
outFile.close()

# Build the players fixture
outFile = File.open("../db/seeds/players.yml","w")
playerToTeam.keys.each do |p|
	outFile.write("p"+p.to_s+":\n")
	outFile.write("  team: t"+playerToTeam[p].to_s+"\n")
end
outFile.close()

# Build the picks fixture
pickFile = File.open("../db/seeds/picks.yml","w")
banFile = File.open("../db/seeds/bans.yml","w")
match_ids.each do |match_id|
	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)['result']
	if json['game_mode'] == 2
		# First picks
		json['picks_bans'].each do |pb|
			if pb['is_pick'] == true
				pickFile.write("pb"+match_id.to_s+"n"+pb['order'].to_s+":\n")
				pickFile.write("  order: "+pb['order'].to_s+"\n")
				pickFile.write("  match: m"+match_id.to_s+"\n")
				pickFile.write("  hero: "+heroNames[pb['hero_id']]+"\n")
				if pb['team'] == 0
					pickFile.write("  team: t"+json['radiant_team_id'].to_s+"\n")
				else
					pickFile.write("  team: t"+json['dire_team_id'].to_s+"\n")
				end
			else
				banFile.write("pb"+match_id.to_s+"n"+pb['order'].to_s+":\n")
				banFile.write("  order: "+pb['order'].to_s+"\n")
				banFile.write("  match: m"+match_id.to_s+"\n")
				banFile.write("  hero: "+heroNames[pb['hero_id']]+"\n")
				if pb['team'] == 0
					banFile.write("  team: t"+json['radiant_team_id'].to_s+"\n")
				else
					banFile.write("  team: t"+json['dire_team_id'].to_s+"\n")
				end
			end
		end
	end
end
pickFile.close()
banFile.close()

# outFile = File.open("api_abilitybuilds.yml","w")
# match_ids.each do |match_id|
# 	json = JSON.parse(File.open("matches/"+match_id.to_s+".json").read)
# 	json['result']['players'].each do |p|
# 		outFile.write("- build_id: "+match_id.to_s+"-"+p['account_id'].to_s+"\n")
# 		for i in 1..p['ability_upgrades'].size
# 			outFile.write("  ability_"+i.to_s+"_id: "+p['ability_upgrades'][i-1]['ability'].to_s+"\n")
# 			outFile.write("  ability_"+i.to_s+"_time: "+p['ability_upgrades'][i-1]['time'].to_s+"\n")
# 		end
# 		for i in p['ability_upgrades'].size+1..25
# 			outFile.write("  ability_"+i.to_s+"_id: NA"+"\n")
# 			outFile.write("  ability_"+i.to_s+"_time: NA"+"\n")
# 		end
# 	end
# end
# outFile.close()