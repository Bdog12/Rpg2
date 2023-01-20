extends Node2D


# Holds all the variables that the player uses .


export var Name = ""
export var Maxhealth = 20
export var CurrentHealth = 20
export var Attack = 3
var list_of_Skills =  []
onready var  timer = $Blink/Timer

var Enemies_Killed = 0
var Exp_from_Enemies =[0,0,0,0]
var Level = 1
var Battle_xp = 0
var Current_Xp =0
var Block_power = 0
var Needed_Xp_For_LevelUp 
var leveled_up_this_battle= false
onready var  animation = $Blink
onready var  animation_Damage_Mover = $Damage_Mover


func Take_damage(damage):# Takes the damage from the enemy and subtracts it from the 
	CurrentHealth-= damage - Block_power
	$Label.text = "-" + str( -damage + Block_power)
	animation_Damage_Mover.play("Damage move up")
	animation.play("HitEffect")
	timer.start(.2)
	
	

func _ready():
	print(list_of_Skills)
	Needed_Xp_For_LevelUp = Get_Needed_xp()
	KnightVarables.Needed_Xp_For_LevelUp= Needed_Xp_For_LevelUp  
	KnightVarables.leveled_up_this_battle= false
	updateStats()
	
	
	
func Get_Needed_xp():
	return KnightVarables.Level* 20

func gain_experience(Amount): #gets the exp from the units that was killed
	print(Enemies_Killed,"XP Gain")
	Exp_from_Enemies[Enemies_Killed]+= Amount
	print(Exp_from_Enemies[Enemies_Killed])
	Enemies_Killed +=1
	
func Battle_finished_Add_xp():        #Adds the exp from all the enemies killed 
	# The enemies that were killd are placed in a array and then 
	$SkilHolder/skillControls.visible = false
	var i = 0
	while Enemies_Killed > i:
		Add_exp(i)
		$"../BattleOverUi".Battle_End()
		yield(get_tree().create_timer(2), "timeout")
		i +=1
		while KnightVarables.Current_Xp>= Needed_Xp_For_LevelUp:
			KnightVarables.leveled_up_this_battle= true
			KnightVarables.Current_Xp -= Needed_Xp_For_LevelUp
			level_up()
			$"../BattleOverUi".Set_level()
			$"../BattleOverUi".value_to_zero()
			
	
func level_up(): # Increases the states of the player and updates the skill that the player
	print("leveled up")	
	KnightVarables.Level += 1
	Needed_Xp_For_LevelUp = Get_Needed_xp()
	KnightVarables.Needed_Xp_For_LevelUp= Needed_Xp_For_LevelUp  
	var stats = ["Maxhealth", "Attack"]
	
	KnightVarables.Attack += 2
	KnightVarables.Maxhealth += 3
	$SkilHolder.Update_Skills()
	
	
func updateStats():
	Level = KnightVarables.Level
	Current_Xp = KnightVarables.Current_Xp
	Needed_Xp_For_LevelUp = KnightVarables.Needed_Xp_For_LevelUp
	Maxhealth = KnightVarables.Maxhealth
	CurrentHealth = KnightVarables.CurrentHealth
	Attack = KnightVarables.Attack
	
	
	
	
func Add_exp(Enemy):
	KnightVarables.Current_Xp += Exp_from_Enemies[Enemy]
		


func _on_Timer_timeout():
	animation.play("stopHiteffect")

