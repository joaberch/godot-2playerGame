extends CharacterBody2D

@onready var animation = $SpriteSheet/AnimationPlayer

var stringanimation = ""

func _physics_process(delta):
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
	elif velocity.x < 0:
		stringanimation = "left"
	
	if velocity.y > 0:
		stringanimation = "down"
	elif velocity.y < 0:
		stringanimation = "up"
	
	if velocity.x == 0 && velocity.y == 0:
		stringanimation = "RESET"
	
	animation.play(stringanimation)
