extends Node

const high_score_file = 'user://high_score.dat'
func load_high_score():
	# Returns 0 if no high score has been set or if the file is corrupted
	var file = File.new()
	if file.file_exists(high_score_file):
		file.open(high_score_file, File.READ)
		var high_score = file.get_64()
		file.close()
		return high_score
	else:
		return 0

func save_high_score(new_high_score):
	var file = File.new()
	file.open(high_score_file, File.WRITE)
	file.store_64(int(new_high_score))
	file.close()
