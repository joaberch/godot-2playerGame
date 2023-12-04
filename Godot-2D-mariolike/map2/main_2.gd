extends Node2D

@onready var shurikenscene = preload("res://shuriken/shuriken.tscn")
@onready var shurikenTimer = $shootShuriken
@onready var goldKnightDamageTaken = $goldKnightFace/Label
@onready var knightDamageTaken = $knightFace/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	shurikenTimer.wait_time = Global.shurikencooldown
	shurikenTimer.start()

func _process(_delta):
	writeScore()

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
	Global.checkIsKnight = false
	var newShurikenGoldKnight = shurikenscene.instantiate()
	add_child(newShurikenGoldKnight)

func spawnKnightShuriken():
	Global.checkIsKnight = true
	var newShurikenKnight = shurikenscene.instantiate()
	add_child(newShurikenKnight)

func changeShurikenCooldown():
	if Global.shurikencooldown >= 0.3:
		Global.shurikencooldown -= 0.1
	shurikenTimer.wait_time = Global.shurikencooldown
