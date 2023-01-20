extends Node2D


onready var enemy = $".."
onready var timer = $EnemySkill/Timer
onready var yeild_timer = 0
var current_target 
export var HitTimer = 0
func _ready():
	$EnemySkill/HeroBar2.max_value = enemy.Skill1_CoolDown
	timer.wait_time = enemy.Skill1_CoolDown
	timer.start()
	timer.connect("timeout",self,"On_timer1_out")
	
	
	

	
func On_timer1_out():
	if enemy.Alive:
		print("Attacked")
		$EnemySkill/Message.text = "attacks"
		$"../AnimatedSprite".play("Attack")
		yield(get_tree().create_timer(.55), "timeout")#.55
		if  enemy.Alive:
			current_target.Take_damage(enemy.Attack)
			$EnemySkill/Message.text = "waiting"
		yield(get_tree().create_timer(.8), "timeout")
		if  enemy.Alive: # Checks if the enemy isn't ataacking while dead
			#current_target.CurrentHealth -= enemy.Attack
			#$EnemySkill/Message.text = "waiting"
			timer.start()
			$"../AnimatedSprite".play("idle")
