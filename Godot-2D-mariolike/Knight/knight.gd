extends CharacterBody2D

@onready var animation = $SpriteSheet/AnimationPlayer

var stringanimation = ""

func _physics_process(delta):
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
	elif velocity.x < 0:
		stringanimation = "left"
	
	if velocity.y > 0:
		stringanimation = "down"
	elif velocity.y < 0:
		stringanimation = "up"
	
	if velocity.x == 0 && velocity.y == 0:
		stringanimation = "RESET"
	
	animation.play(stringanimation)
