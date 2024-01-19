extends CharacterBody2D

@onready var animation = $SpriteSheet/AnimationPlayer

var stringanimation = "downIdle"
var weapon = "fist"
var checkAttack
var checkIsAttacking
var cptr = 0
var minigame2winner

func _ready():
	visible = true

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
		Global.knightDirection = "right"
	elif velocity.x < 0:
		stringanimation = "left"
		Global.knightDirection = "left"
		
	if velocity.y > 0:
		stringanimation = "down"
		Global.knightDirection = "down"
	elif velocity.y < 0:
		stringanimation = "up"
		Global.knightDirection = "up"
	
	if velocity.x == 0 && velocity.y == 0:
		if Global.knightDirection == "left":
			stringanimation = "leftIdle"
		elif Global.knightDirection == "right":
			stringanimation = "rightIdle"
		elif Global.knightDirection == "down":
			stringanimation = "downIdle"
		elif Global.knightDirection == "up":
			stringanimation = "upIdle"
		else:
			stringanimation = "RESET"
		
	animation.play(stringanimation)
