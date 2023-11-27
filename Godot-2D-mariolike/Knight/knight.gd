extends CharacterBody2D

@onready var animation = $SpriteSheet/AnimationPlayer

var stringanimation = "downIdle"
var direction

func _physics_process(_delta):
	moveplayer()
	getPosition()
	animateplayer()
	move_and_slide()

func getPosition():
	Global.knightpositionx = global_position.x
	Global.knightpositiony = global_position.y

func moveplayer():
	velocity.x=0
	velocity.y=0
	
	if Input.is_action_pressed("right"):
		velocity.x = Global.knightspeed
	elif Input.is_action_pressed("left"):
		velocity.x = -Global.knightspeed
	
	if Input.is_action_pressed("down"):
		velocity.y = Global.knightspeed
	elif Input.is_action_pressed("up"):
		velocity.y = -Global.knightspeed

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
		if direction == "left":
			stringanimation = "leftIdle"
		elif direction == "right":
			stringanimation = "rightIdle"
		elif direction == "down":
			stringanimation = "downIdle"
		elif direction == "up":
			stringanimation = "upIdle"
		else:
			stringanimation = "RESET"
		
	
	animation.play(stringanimation)
