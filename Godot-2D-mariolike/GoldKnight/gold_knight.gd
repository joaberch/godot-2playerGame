extends CharacterBody2D

@onready var animation = $SpriteSheet/AnimationPlayer

var stringanimation = "downIdle"
var direction
var weapon = "fist"

func _physics_process(_delta):
	moveplayer()
	getPosition()
	animateplayer()
	move_and_slide()

func getPosition():
	Global.goldKnightPositionx = global_position.x
	Global.goldKnightPositiony = global_position.y

func moveplayer():
	velocity.x=0
	velocity.y=0
	
	if Input.is_action_pressed("right-D"):
		velocity.x = Global.goldknightspeed
	elif Input.is_action_pressed("left-A"):
		velocity.x = -Global.goldknightspeed
	
	if Input.is_action_pressed("down-S"):
		velocity.y = Global.goldknightspeed
	elif Input.is_action_pressed("up-W"):
		velocity.y = -Global.goldknightspeed

func animateplayer():
	if velocity.x > 0:
		stringanimation = "right"
		direction = "right"
	elif velocity.x < 0:
		stringanimation = "left"
		direction = "left"
	
	if velocity.y > 0:
		stringanimation = "down"
		direction = "down"
	elif velocity.y < 0:
		stringanimation = "up"
		direction = "up"
	
	if velocity.x == 0 && velocity.y == 0:
		if direction == "right":
			stringanimation = "rightIdle"
		elif direction == "left":
			stringanimation = "leftIdle"
		elif direction == "up":
			stringanimation = "upIdle"
		elif direction == "down":
			stringanimation = "downIdle"
		else:
			stringanimation == "RESET"
	
	animation.play(stringanimation)
