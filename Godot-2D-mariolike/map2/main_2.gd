extends Node2D

@onready var flameScene = preload("res://fireBall/fire_ball.tscn")
@onready var plantBullet = preload("res://plantBall/acid_ball.tscn")
@onready var shurikenscene = preload("res://shuriken/shuriken.tscn")
@onready var shurikenTimer = $shootShuriken
@onready var goldKnightDamageTaken = $goldKnightFace/Label
@onready var knightDamageTaken = $knightFace/Label
@onready var timeRemaining = $timeRemaining
@onready var timerGame = $gameTimer
@onready var lastTimer = $TimerBeforeHome
@onready var lastTimerOvertime = $lastTimerOvertime
@onready var frogAnimationTimer = $frogAnimationTime

@onready var knight = $Knight
@onready var goldKnight = $GoldKnight
@onready var greenFrog = $greenfrog
@onready var redFrog = $redFrog

var checkOvertime
var checkGameHasEnded

# Called when the node enters the scene tree for the first time.
func _ready():
	shurikenTimer.wait_time = Global.shurikencooldown
	shurikenTimer.start()
	timerGame.start()
	Global.knightDamageTaken = 0
	Global.goldKnightDamageTaken = 0

func _process(_delta):
	writeScore()
	writeTimeRemaining()
	
	#If it's in the overtime
	if checkOvertime:
		overtimeCheckHasEnded()
	
	#If game has ended
	if checkGameHasEnded:
		$overtime.visible = false

func overtimeCheckHasEnded():
	timeRemaining.visible = false
	$overtime.visible = true
	if Global.knightDamageTaken > Global.goldKnightDamageTaken:
		$player2win.visible = true
		lastTimerOvertime.start()
		get_tree().change_scene_to_file(Global.scenerandomChoose) #TODO : correct the error with the timer (it doesn't end/start?)
	elif Global.knightDamageTaken < Global.goldKnightDamageTaken:
		$player1win.visible = true
		lastTimerOvertime.start()
		get_tree().change_scene_to_file(Global.scenerandomChoose) #TODO : correct the error with the timer (it doesn't end/start?)

func writeTimeRemaining():
	if !checkGameHasEnded:
		timeRemaining.text = str(round(timerGame.time_left))
	else:
		timeRemaining.visible = false

func _on_shoot_shuriken_timeout():
	changeShurikenCooldown()
	spawnKnightShuriken()
	spawnGoldKnightShuriken()
	restartCooldown()

func writeScore():
	goldKnightDamageTaken.text = str(Global.goldKnightDamageTaken)
	knightDamageTaken.text = str(Global.knightDamageTaken)

func restartCooldown():
	shurikenTimer.start()

func spawnGoldKnightShuriken():
	if !checkGameHasEnded:
		Global.checkIsKnight = false
		var newShurikenGoldKnight = shurikenscene.instantiate()
		add_child(newShurikenGoldKnight)

func spawnKnightShuriken():
	if !checkGameHasEnded:
		Global.checkIsKnight = true
		var newShurikenKnight = shurikenscene.instantiate()
		add_child(newShurikenKnight)

func changeShurikenCooldown():
	if Global.shurikencooldown >= 0.3:
		Global.shurikencooldown -= 0.05
	shurikenTimer.wait_time = Global.shurikencooldown


func _on_game_timer_timeout():
	if Global.knightDamageTaken > Global.goldKnightDamageTaken:
		$player2win.visible = true
		lastTimer.start()
		checkGameHasEnded = true
	elif Global.knightDamageTaken < Global.goldKnightDamageTaken:
		$player1win.visible = true
		lastTimer.start()
		checkGameHasEnded = true
	else:
		checkOvertime = true

func _on_timer_before_home_timeout():
	get_tree().change_scene_to_file(Global.scenerandomChoose)


func _on_last_timer_overtime_timeout():
	get_tree().change_scene_to_file(Global.scenerandomChoose)


func _on_frog_attack_timeout():
	frogAnimationTimer.start()
	Global.checkFrogAreAttacking = true


func _on_frog_animation_time_timeout():
	if !checkGameHasEnded:
		if Global.checkRedFrogCanAttack && Global.checkRedFrogIsAlive:
			var newFireBall = flameScene.instantiate()
			add_child(newFireBall)
			Global.checkFrogAreAttacking = false
		if Global.checkGreenFrogCanAttack && Global.checkGreenFrogIsAlive:
			var newPlantBullet = plantBullet.instantiate()
			add_child(newPlantBullet)
			Global.checkFrogAreAttacking = false
		
		Global.checkRedFrogCanAttack = true
		Global.checkGreenFrogCanAttack = true
		$frogAttack.start()
