extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D

func _physics_process(delta):
	attackowl()
	move_and_slide()

func attackowl():
	if Global.playerpositionx > global_position.x+10:
		velocity.x = Global.catspeed
		sprite.flip_h = false
		animations.play("Right")
	elif Global.playerpositionx < global_position.x-10:
		sprite.flip_h = true
		velocity.x = -Global.catspeed
		animations.play("Right")
	else:
		velocity.x = 0
	
	if Global.playerpositiony > global_position.y:
		velocity.y = Global.catspeed
	elif Global.playerpositiony < global_position.y:
		velocity.y = -Global.catspeed
	else:
		velocity.y = 0
