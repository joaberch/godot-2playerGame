extends Node2D

@onready var shurikenscene = preload("res://shuriken/shuriken.tscn")
@onready var shurikenTimer = $shootShuriken

# Called when the node enters the scene tree for the first time.
func _ready():
	shurikenTimer.wait_time = Global.shurikencooldown
	shurikenTimer.start()

func _on_shoot_shuriken_timeout():
	if Global.shurikencooldown > 0.2:
		Global.shurikencooldown -= 0.1
	shurikenTimer.wait_time = Global.shurikencooldown
	
	Global.checkIsKnight = true
	var newShurikenKnight = shurikenscene.instantiate()
	add_child(newShurikenKnight)
	
	Global.checkIsKnight = false
	var newShurikenGoldKnight = shurikenscene.instantiate()
	
	shurikenTimer.start()
	add_child(newShurikenGoldKnight)
