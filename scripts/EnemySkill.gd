extends Control

export var Skill_Name ="Sword Swipe"
export var Damage_type = "Slash"
export var Attacks_Details = ""
export var timerMax = 0

var  Time_Skill_1 = .01
var Can_Use_Skill_1 = false
var Can_Use_Skill_2 = false
var  attacking = false
onready var Skill_1_Timer = $Timer
onready var Host = $"../.."
onready var skillDamageLable = $Details
onready var SkillName =$HeroBar2/Control/Name
onready var Skill_1_Card = $HeroBar2
onready var Skill_1_Card_Time = $HeroBar2/timerValue

func _ready(): 
	
	SkillName.text = Skill_Name
	skillDamageLable.text = Attacks_Details
	
	
	#Skill_1_Card.max_value = timerMax
	Skill_1_Timer.start()
	
	
func _process(_delta):
	if Host.Alive:
		test()
	else:
	 Skill_1_Card_Time.text = ""
	
func Check_skill_1():
	if Can_Use_Skill_1:
		attacking = true
		Skill_1_Card_Time.update_text = "attacks"
		yield(get_tree().create_timer(0.25), "timeout")
		Skill_1_Timer.start()
		attacking = false
		



func test():
	if ! Can_Use_Skill_1:
		Time_Skill_1 = stepify(Skill_1_Timer.time_left,0.1)
		Skill_1_Card.value = Time_Skill_1
		#Skill_1_Card_Time.text = str(Time_Skill_1)
		Skill_1_Card_Time.text = ""
		

func _on_Timer_timeout():
	Can_Use_Skill_1 = true
	Check_skill_1()
	
	
