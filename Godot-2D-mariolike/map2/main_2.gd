extends Node2D

@onready var shuriken = preload("res://shuriken/shuriken.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_shoot_shuriken_timeout():
	var shuriken = shuriken.instantiate()
