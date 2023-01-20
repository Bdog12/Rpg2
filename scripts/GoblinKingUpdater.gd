extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../Enemies/enemy3/skillControls".TeamMate = $"../Enemies/enemy1"
	$"../Enemies/enemy3/skillControls".TeamMate2 = $"../Enemies/enemy2"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
