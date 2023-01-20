extends Node2D


#Updates the current skill set, actives every time the player levels up[

onready var Level1 =[$skillControls,$skillControls2,$skillControls3,$skillControls4,$skillControls5,$skillControls6,]



func Update_Skills():# Set all other skill sets to not visible , and set the currrent corresponding skill
	for i in Level1:
		i.visible = false
	Level1[KnightVarables.Level -1].visible = true
	
func _ready():
	Update_Skills()
		
