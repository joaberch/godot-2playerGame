extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D
var checkSlow = 1

func _physics_process(_delta):
	attackowl()
	
	#If the owl is touched
	if Global.changephase:
		newgame()
	
	move_and_slide()

func newgame():
	position.x = -50
	position.y = -50

func attackowl():
	if Global.playerpositionx > global_position.x+10:
		velocity.x = Global.catspeed/checkSlow
		sprite.flip_h = false
		animations.play("Right")
	elif Global.playerpositionx < global_position.x-10:
		sprite.flip_h = true
		velocity.x = -Global.catspeed/checkSlow
		animations.play("Right")
	else:
		velocity.x = 0
		
	
	if Global.playerpositiony > global_position.y:
		velocity.y = Global.catspeed/checkSlow
	elif Global.playerpositiony < global_position.y:
		velocity.y = -Global.catspeed/checkSlow
	else:
		velocity.y = 0

func _on_footdetection_area_entered(area):
	if area.name == "slow":
		checkSlow = 2


func _on_footdetection_area_exited(area):
	if area.name == "slow":
		checkSlow = 1
