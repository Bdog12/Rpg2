extends Node2D
export var Level:PackedScene
export var LevelName = ""
export var CanBeExplored = false
onready var green = $green
onready var red = $red
export(String,"PlainsUpdate","PondUpdate", "Beach1Update","WheatUpdate" ,"GraveYardUpdate", "SlimesMapUpdate","CheckPointUpdate", "BeachPath", "GoblinTownUpdate" , "DarkForestUpdate" ,"CrossRoadsUpdate","Beach2Update", "Null") var PathThatOpens #Same name as the Animationplayer
func _ready():
	setColor()

func _on_Button_mouse_entered():
	$Label.visible = true
	

func _on_Button_mouse_exited():
	$Label.visible = false



func _physics_process(_delta):
	pass
	#setColor()

func loadSence(): # This happans when the button on the level is pressed , it loads the 
	print(Level)
	OverWorldValues.pathToOpen = PathThatOpens
	KnightVarables.Current_Level = $"../slimes"
	$"../../AnimationPlayer".play(LevelName)
	yield(get_tree().create_timer(3.5), "timeout")
	$"../../AudioStreamPlayer2D".playing = false
	save_scene()
	get_tree().change_scene_to(Level)


	#////////////////////////////////////////////////////////////////////////////
	
	# This is how the game is being saved currently every time a level is loaded the Overworld map is saved
	# saving the progess of the player I want to find a better way of doing this.
func save_scene(): #  
	var file_path = "res://Sences/OverworldMap.tscn"
	var scene = PackedScene.new()
	scene.pack($"../..")
	ResourceSaver.save(file_path,scene)
	#////////////////////////////////////////////////////////////////////////////////
func setColor():
	print_debug("Color Set")
	if CanBeExplored == false:
		red.visible = true
		green.visible = false
		$Label.text = "Can't explore"
	else:
		red.visible = false
		green.visible = true
		$Label.text = "explore?"




