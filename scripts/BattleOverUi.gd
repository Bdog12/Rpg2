extends Control


#Ed

onready var tween = $XP_bar1/Tween
onready var Knight 
onready var Exp_Bar = $XP_bar1
func Battle_End(): 
	$AnimationPlayer.play("Head Idle")
	$XP_bar1/level_Up.visible = KnightVarables.leveled_up_this_battle
	#$XP_bar1/Exp.max_value = KnightVarables.Needed_Xp_For_LevelUp
	$XP_bar1.Battle_End()
	
func value_to_zero():
	$XP_bar1.value_to_zero()
func Set_level():
	$XP_bar1.Set_level()
