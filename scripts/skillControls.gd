extends Node2D



# Chooses which skill is being played based on the skill name picked in the editer
#I didnt know a other way to do this so if you have any other way feel free to fix it
var currentEnemy
onready var Hero1 =$"../.."
onready var timer1_Hero1 = $Skiil/Timer
onready var timer2_Hero1 = $Skiil2/Timer
var Attacking = false
export(int,"Block" ,"Normal Attack", "Quick Attack" ) var SKill_1
export(int, "Block","Normal Attack", "Quick Attack") var Skill_2
func _ready(): 
	
	var button = $Skiil/Button1
	button.connect("button_down",self,"_on_Button1_button_down")
	var button2 = $Skiil2/Button1
	button2.connect("button_down",self,"_on_Button2_button_down")
	
	
	
	
func _on_Button1_button_down():
	if $Skiil.Can_Use_Skill_1:
		if !Attacking:
			Skill_Picker(SKill_1)
	
		
func _on_Button2_button_down():
	if $Skiil2.Can_Use_Skill_1:
		if !Attacking:
			Skill_Picker(Skill_2)
			
			
			
			
func Quick_attack():
		currentEnemy = KnightVarables.currentTarget
		Attacking = true
		$"../../AnimatedSprite".play("Attack")
		timer1_Hero1.start(timer1_Hero1.get_time_left() - .5)
		yield(get_tree().create_timer(.8), "timeout")
		currentEnemy.Take_damage(Hero1.Attack,Hero1)
		yield(get_tree().create_timer(.2), "timeout")
		timer2_Hero1.start()
		$Skiil2.Can_Use_Skill_1 = false
		Attacking = false
		$"../../AnimatedSprite".play("idle")
		
func Normal_Attack():
	Attacking = true
	$"../../AnimatedSprite".play("Attack")
	$Skiil.Can_Use_Skill_1 = false
	currentEnemy = KnightVarables.currentTarget
	yield(get_tree().create_timer(.8), "timeout")
	currentEnemy.Take_damage(Hero1.Attack,Hero1)
	yield(get_tree().create_timer(.2), "timeout")
	timer1_Hero1.start($Skiil.timerMax)
	Attacking = false
	$"../../AnimatedSprite".play("idle")
func Block():
	Attacking = true
	print("Blocked")
	$"../../AnimatedSprite".play("Attack")# change to block
	$Skiil.Can_Use_Skill_1 = false
	$"../..".Block_power += 2
	yield(get_tree().create_timer(1), "timeout")
	$"../..".Block_power = 0
	timer1_Hero1.start($Skiil.timerMax)
	Attacking = false
	$"../../AnimatedSprite".play("idle")
	
	
	
	
	
	
func Skill_Picker(Skill_Name):
	if Skill_Name == 1:
		Normal_Attack()
	elif Skill_Name == 2:
		Quick_attack()
	elif Skill_Name == 0:
		Block()
