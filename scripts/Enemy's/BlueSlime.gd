extends Node2D

var Alive = true 
export var  Name ="Name of Unit"
export var Maxhealth = 20
export var CurrentHealth = 20
export var Attack = 3
export var Skill1_CoolDown = 3
export var Xp_value = 2
onready var timer_skill1 = $skillControls/EnemySkill/Timer
var enemy_list
export var timerMax = 0
onready var  animation = $Blink
onready var  timer = $Blink/Timer
onready var  animation_Damage_Mover = $Damage_Mover
onready var pointer = $Message/pointer

func _ready():
	timer_skill1.wait_time = Skill1_CoolDown
	CurrentHealth = Maxhealth
	
	
func Take_damage(Damage_amount,Damager):
	if Alive:
		CurrentHealth -= Damage_amount
		$Label.text = "-" + str(  Damage_amount)
		animation_Damage_Mover.play("Damage move up")
		animation.play("HitEffect")
		timer.start(.2)
		if CurrentHealth <= 0:
			CurrentHealth = 0
			Alive =false
		if !Alive:
			enemy_list = $"..".get_children()
			print(enemy_list)
			Give_Xp(Damager)
			$AnimatedSprite.play("Death")
			timer_skill1.stop()
			$skillControls.visible = false
			$Message/TextBox.text = "Dead"
			Check_if_all_enimes_are_Dead()
			
func Give_Xp(Killer):
	Killer.gain_experience(Xp_value)
	
func Check_if_all_enimes_are_Dead():
	 #still need to add third enemy into this code
	if !enemy_list[0].Alive and !enemy_list[1].Alive and !enemy_list[2].Alive:
		print("all enemies are dead")
		$"../..".Battle_Over()
 

func pointerOn():
	pointer.visible = true
func pointerOff():
	pointer.visible = false

func _on_Timer_timeout():
	animation.play("stopHiteffect")
