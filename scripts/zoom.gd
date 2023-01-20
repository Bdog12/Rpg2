extends Node2D

#The zoom in  and zoom out function for the overworld map

onready var cam =$YoungKnightsHead/Camera2D2
export var  camZoom = 2

func zoom():
	if cam.zoom.x < 2.5 :
		if Input.is_action_just_released("wheeldown"):
			(cam.zoom)
			cam.zoom.x += 0.1
			cam.zoom.y += 0.10
	
	if Input.is_action_just_released("wheelup") and cam.zoom.x > 1 and cam.zoom.y > 1:
		cam.zoom.x -= 0.1
		cam.zoom.y -= .1
	if cam.zoom.y > camZoom:
		cam.zoom.y = camZoom
	if cam.zoom.x > camZoom:
		cam.zoom.x = camZoom
func _process(delta):
	zoom()
