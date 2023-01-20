extends Node2D



onready var enemy = $".."
onready var timer = $EnemySkill/Timer
onready var yeild_timer = 0
var current_target 
var TeamMate
var TeamMate2
export var HitTimer =.1
func _ready():
	$EnemySkill/HeroBar2.max_value = enemy.Skill1_CoolDown
	timer.wait_time = enemy.Skill1_CoolDown
	timer.start()
	timer.connect("timeout",self,"On_timer1_out")
	
	
	

	
func On_timer1_out():
	if enemy.Alive:
		$EnemySkill/Message.text = "attacks"
		$"../AnimatedSprite".play("Attack")
		TeamMate.Attack += 1
		TeamMate2.Attack += 1
		yield(get_tree().create_timer(.8), "timeout")
		if  enemy.Alive: # Checks if the enemy isn't ataacking while dead
			#current_target.CurrentHealth -= enemy.Attack
			#$EnemySkill/Message.text = "waiting"
			timer.start()
			$"../AnimatedSprite".play("idle")
