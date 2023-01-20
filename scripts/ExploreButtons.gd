extends Button

onready var Marker = $".."

func _on_green_pressed():
	Marker.loadSence()
