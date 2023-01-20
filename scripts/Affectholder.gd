extends Node2D




var currentEnemy
onready var Hero1 = $"..".Hero
onready var timer1_Hero1 = $"../Timer"
onready var timer2_Hero1 = $Skiil2/Timer
var Attacking = false


func _on_Button1_button_down():
	if $"..".Can_Use_Skill_1:
		if  !Attacking:
			Attacking = true
			$"../AnimatedSprite".play("Attack")
			$Skiil.Can_Use_Skill_1 = false
			yield(get_tree().create_timer(.8), "timeout")
			currentEnemy.Take_damage(Hero1.Attack,Hero1)
			yield(get_tree().create_timer(.2), "timeout")
			timer1_Hero1.start($Skiil.timerMax)
			print("Skill_1")
			Attacking = false
			$"../AnimatedSprite".play("idle")
	
