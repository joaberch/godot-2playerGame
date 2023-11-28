extends Node2D

@onready var shurikenscene = preload("res://shuriken/shuriken.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_shoot_shuriken_timeout():
	Global.checkIsKnight = true
	var newShurikenKnight = shurikenscene.instantiate()
	add_child(newShurikenKnight)
	
	Global.checkIsKnight = false
	var newShurikenGoldKnight = shurikenscene.instantiate()
	add_child(newShurikenGoldKnight)
