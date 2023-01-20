extends Button

# Code for the main menu buttons
export var LoadedObject:PackedScene
onready var soundMaker = $"../soundMaker"
onready var enterSound = $"../enter"


func _on_StartButton_pressed():
	soundMaker.play()
	get_tree().change_scene_to(LoadedObject)
	



func _on_StartButton_mouse_entered():
	soundMaker.play()


func _on_Settings_mouse_entered():
	soundMaker.play()
