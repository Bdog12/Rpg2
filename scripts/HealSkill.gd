extends Node2D

export var MaxHealth = 20
export var HealAmount = 3
onready var enemy = $".."
onready var timer = $EnemySkill/Timer
onready var yeild_timer = 0
var current_target 
export var HitTimer =.1
onready var  animation_Damage_Mover =$"../Damage_Mover"
func _ready():
	$EnemySkill/HeroBar2.max_value = enemy.Skill1_CoolDown
	timer.wait_time = enemy.Skill1_CoolDown
	timer.start()
	timer.connect("timeout",self,"On_timer1_out")
	
	
	
# The skill that heals its user 
	
func On_timer1_out():
	if enemy.Alive:
		$EnemySkill/Message.text = "Heal"
		#$"../AnimatedSprite".play("Heal")
		if enemy.CurrentHealth < MaxHealth:
			print("Heal")
			enemy.CurrentHealth += HealAmount 
			if enemy.CurrentHealth > MaxHealth:
				current_target = MaxHealth
			$"../Label".text = "+" + str(HealAmount) 
			animation_Damage_Mover.play("Heal") 
			
	timer.start() # reset the skill timer 

