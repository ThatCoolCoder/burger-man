extends Node

const high_score_file = "user://high_score.dat"
const played_before_file = "user://played_before.dat"
var crnt_score := 0.0
const display_multiplier := 10.0
var speed_multiplier := 1.0
const speed_multiplier_multiplier := 0.5 # speed mult goes up this much for player size

func load_high_score():
	# Returns 0 if no high score has been set or if the file is corrupted
	var file = File.new()
	if file.file_exists(high_score_file):
		file.open(high_score_file, File.READ)
		var high_score = file.get_float()
		file.close()
		return high_score
	else:
		return 0

func save_high_score(new_high_score):
	var file = File.new()
	file.open(high_score_file, File.WRITE)
	file.store_float(new_high_score)
	file.close()

func load_played_before():
	var file = File.new()
	if file.file_exists(played_before_file):
		file.open(played_before_file, File.READ)
		var played_before = file.get_8()
		file.close()
		return played_before == 1
	else:
		return false

func save_played_before(played_before: bool):
	var file = File.new()
	file.open(played_before_file, File.WRITE)
	file.store_8(int(played_before))
	file.close()
