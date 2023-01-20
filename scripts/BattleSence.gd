extends Node2D

#notes
#Comabt Idea attacks are on a cool down and need to be click to be used
#enemies attacks are auto , but can depend on enemy
# comabt center around making the cold downs go fast , 
#for example an attack can make a other skill's cold down be reduced if ir lands or other conditions

onready var Hero1 = $Knight
onready var enemy1 = $Enemies/enemy1
onready var enemy2 = $Enemies/enemy2
onready var enemy3 = $Enemies/enemy3
onready var SpawnLocationEnemies = $EnemySpawn
onready var SpawnLocationHeros = $HeroSpwanLocation

onready var gamedata = SaveFlie.game_date

var overworldKnight = load("res://scenes/Knight.tscn").instance()

export var LevelName =""
export var HeroBar_ON = [true,false,false]
export var EnemisBar_ON = [true,false,false]

#onready var Enemy1_attack_timer = $Enemies/enemy1/EnemySkill/Timer
var placeholder = 0
var current_Target
var enemy_list = []
onready var SkillSetName = $Knight/SkilHolder/skillControls.currentEnemy

#export(PackedScene) var Enemy2
#export(PackedScene) var Enemy3

#export(PackedScene) var hero1
#export(PackedScene) var hero2
#export(PackedScene) var hero3

func _ready():
	
	#$Knight/skillControls.currentEnemy = current_Target
	$Enemies/enemy2/skillControls/.current_target = Hero1
	$Enemies/enemy1/skillControls/.current_target = Hero1
	$Enemies/enemy3/skillControls/.current_target = Hero1
	 # sets the target for the Knight's skill
	enemy_list = $Enemies.get_children()
	KnightVarables.currentTarget= enemy_list[2]
	print(SkillSetName)
	
	_Rename_Nodes()
	


func _process(_delta):
	#print(timer1_Hero1.get_time_left())
	$UI/HeroBar/HealthNumber.text = str(Hero1.CurrentHealth ) + "/"+str(Hero1.Maxhealth)
	$UI/emenyBar/HealthNumber.text = str(enemy1.CurrentHealth ) + "/"+str(enemy1.Maxhealth)
	$UI/emenybar2/HealthNumber.text = str(enemy2.CurrentHealth ) + "/"+str(enemy2.Maxhealth)	
	$UI/emenybar3/HealthNumber.text = str(enemy3.CurrentHealth ) + "/"+str(enemy3.Maxhealth)	
	$UI/HeroBar.value = Hero1.CurrentHealth
	$UI/HeroBar.max_value = Hero1.Maxhealth
	$UI/emenyBar.value = enemy1.CurrentHealth
	$UI/emenybar2.value = enemy2.CurrentHealth
	$UI/emenybar3.value = enemy3.CurrentHealth
	#Enemy Attacks move this code to the enemy skill sript
	
	
	# chances the target of the skill for the knight 
func _input(_event):
	if Input.is_action_just_pressed("E"):
		placeholder += 1
		if placeholder > 2:
			placeholder = 0
	KnightVarables.currentTarget = enemy_list[placeholder]
	for _A in enemy_list:
		_A.pointerOff()
	KnightVarables.currentTarget.pointerOn()
	if Input.is_action_just_pressed("Q"):
		placeholder -= 1
		if placeholder < 0:
			placeholder = 2
	KnightVarables.currentTarget = enemy_list[placeholder]
	#if Input.is_action_just_pressed("ui_up"):
		#if  KnightVarables.currentTarget == enemy_list[0]:
			#print("target Changed")
			#KnightVarables.currentTarget = enemy_list[1]
			#$Enemies/enemy2/Message/TextBox.text += "current Target"
			#$Enemies/enemy1/Message/TextBox.text = ""
		#elif KnightVarables.currentTarget == enemy_list[1]:
	#		KnightVarables.currentTarget = enemy_list[2]
			#$Enemies/enemy3/Message/TextBox.text += "current Target"
			#$Enemies/enemy2/Message/TextBox.text = ""
		#lif KnightVarables.currentTarget== enemy_list[2]:
			#KnightVarables.currentTarget = enemy_list[0]
			#$Enemies/enemy1/Message/TextBox.text += "current Target"
			#$Enemies/enemy3/Message/TextBox.text = ""

func Battle_Over():
	$BattleWin.playing = true
	$music.playing = false
	KnightVarables.CurrentHealth = Hero1.CurrentHealth
	$AnimationPlayer.play("BattleOverCut scene")
	yield(get_tree().create_timer(1), "timeout")
	Hero1.Battle_finished_Add_xp()
	$BattleOverUi.Knight = Hero1
	$BattleOverUi.Battle_End()
	
	yield(get_tree().create_timer(8), "timeout")
	var overWorld = load("res://Sences/OverworldMap.tscn")
	SaveFlie.save_data()
	OverWorldValues.BattleWon = true
	get_tree().change_scene_to(overWorld)

	
	queue_free()
	
	
	
 

func save_date_from_Battle():
	pass


func _Rename_Nodes(): #handles all the renaming and labals in this scene
	
	$UI/HeroBar/HealthNumber.text = str(Hero1.CurrentHealth ) + "/"+str(Hero1.Maxhealth)
	$UI/HeroBar2/HealthNumber.text = str(Hero1.CurrentHealth ) + "/"+str(Hero1.Maxhealth)
	$UI/HeroBar3/HealthNumber.text = str(Hero1.CurrentHealth ) + "/"+str(Hero1.Maxhealth)

	$UI/emenyBar/HealthNumber.text =str(enemy1.CurrentHealth ) + "/"+str(enemy1.Maxhealth)
	$UI/emenybar2/HealthNumber.text =str(enemy2.CurrentHealth ) + "/"+str(enemy2.Maxhealth)
	$UI/emenybar3/HealthNumber.text =str(enemy3.CurrentHealth ) + "/"+str(enemy3.Maxhealth)
	
	$UI/HeroBar.max_value = Hero1.Maxhealth
	$UI/emenyBar.max_value = enemy1.Maxhealth
	$UI/emenybar2.max_value = enemy2.Maxhealth
	$UI/emenybar3.max_value = enemy3.Maxhealth
	
	$UI/HeroBar/Name.text = Hero1.Name
	$UI/emenyBar/Name.text = enemy1.Name 
	$UI/emenybar2/Name.text = enemy2.Name 
	$UI/emenybar3/Name.text = enemy3.Name 
	
	$UI/HeroBar.visible = HeroBar_ON[0]
	$UI/HeroBar2.visible = HeroBar_ON[1]
	$UI/HeroBar3.visible =HeroBar_ON[2]
	
	$UI/emenyBar.visible = EnemisBar_ON[0]
	$UI/emenybar2.visible = EnemisBar_ON[1]
	$UI/emenybar3.visible =EnemisBar_ON[2]
	



	#MusicSound effectsSound effects
