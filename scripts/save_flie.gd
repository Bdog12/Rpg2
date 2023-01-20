extends Node

# This is not being used by miught be used to save the state of the game

const SAVE_DIR = "user://saves/"
var  Save_FILE = SAVE_DIR+"save.dat"
var game_date ={"health" : KnightVarables.CurrentHealth,"CurrentLevel": KnightVarables.Current_Level,"level" : KnightVarables.Level,
	
}

func _ready(): 
	load_data()

	

func save_data():
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var  error = file.open_encrypted_with_pass(Save_FILE, File.WRITE, "husky")
	if  error ==OK:
		file.store_var(game_date)
		file.close()
	print("save")
	
	
func load_data():
	var file =File.new()
	if  file.file_exists(Save_FILE):
		var erorr = file.open_encrypted_with_pass(Save_FILE, File.READ, "husky")
		if erorr == OK:
			var player_data = file.get_var()
			print(player_data)
			file.close()
	print("loaded")
	file.open(Save_FILE,File.READ)
	game_date = file.get_var()
	file.close()
