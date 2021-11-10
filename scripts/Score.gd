extends Node

const high_score_file = 'user://high_score.dat'
var crnt_score := 0.0
const display_multiplier := 10.0
var speed_multiplier := 1.0

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
