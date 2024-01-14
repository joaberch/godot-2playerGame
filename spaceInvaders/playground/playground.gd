extends Node2D

@onready var sceneNormalAlien = preload("res://normalEnemy/normal_alien.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.nbrEnemy == 0:
		Global.nbrPhase += 1
		generateEnemy()

func generateEnemy():
	match Global.nbrPhase:
		1:
			for i in range(5):
				#First wave, always spawn 5 ennemies
				var newEnemy = sceneNormalAlien.instantiate()
				add_child(newEnemy)
				
