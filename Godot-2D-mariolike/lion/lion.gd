extends CharacterBody2D

@onready var animationsprite = $SpriteSheet/AnimationPlayer
var stringanimation = ""

func _physics_process(delta):
	movePlayer()
	animatePlayer()
	move_and_slide()

func movePlayer():
	velocity.x=0
	velocity.y=0
	if Input.is_action_pressed("right-D"):
		velocity.x = Global.lionspeed
	elif Input.is_action_pressed("left-A"):
		velocity.x = -Global.lionspeed
	if Input.is_action_pressed("down-S"):
		velocity.y = Global.lionspeed
	elif Input.is_action_pressed("up-W"):
		velocity.y = -Global.lionspeed

func animatePlayer():
	stringanimation = "RESET"
	if Input.is_action_pressed("right-D"):
		stringanimation = "walkright"
	elif Input.is_action_pressed("left-A"):
		stringanimation = "walkleft"
	
	if Input.is_action_pressed("down-S"):
		stringanimation = "walkdown"
	elif Input.is_action_pressed("up-W"):
		stringanimation = "walkup"
		
	animationsprite.play(stringanimation)
