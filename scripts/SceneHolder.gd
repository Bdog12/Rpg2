extends Node2D

var LevelToUnlock = ""



func changeWorld(Name_Of_sence):
	var NewSence = load(Name_Of_sence)
	get_tree().change_scene_to(NewSence)
	
	queue_free()

func _ready():
	print(OverWorldValues.pathToOpen)
	$"../AnimationPlayer".play(OverWorldValues.pathToOpen)
	yield($"../AnimationPlayer","animation_finished")
	$"../MarkerHolder".UpdateMap()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
