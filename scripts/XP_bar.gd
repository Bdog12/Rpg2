extends Control

# manages the xp bar for when the battle ends 
onready var tween = $Tween
onready var Knight 
onready var Exp_Bar = $"."
func Battle_End(): 
	
	Set_level()
	
	
	
	tween.interpolate_property ($Exp,"value", $Exp.value,KnightVarables.Current_Xp,2,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	
	
func _process(_delta):
	#interpolate the text on the exp bar at the same pace as the exp bar
	$Exp.max_value = KnightVarables.Needed_Xp_For_LevelUp
	$Exp/Level_amount.text = str(stepify($Exp.value,1)) + "/" +str(KnightVarables.Needed_Xp_For_LevelUp)
	
func value_to_zero():
	$level_Up.text = "Level up!"
	$Exp.value = 0




func Set_level():
	$Level.text = "Lv "+ str(KnightVarables.Level)
