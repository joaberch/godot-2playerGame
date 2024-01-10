extends Node2D

@onready var gameImage = $gameImage
var speedScale

# Called when the node enters the scene tree for the first time.
func _ready():
	gameImage.play("default")
	speedScale = randf_range(0.001,0.01)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameImage.speed_scale > 0.5:
		gameImage.speed_scale -= speedScale
	else:
		match gameImage.frame:
			0:
				get_tree().change_scene_to_file(Global.sceneminigame1)
			1:
				get_tree().change_scene_to_file(Global.sceneminigame2)
			2:
				get_tree().change_scene_to_file(Global.sceneminigame3)
			
