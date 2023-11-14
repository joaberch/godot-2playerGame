extends CharacterBody2D

@onready var animationsprite = $SpriteSheet/AnimationPlayer
var stringanimation = ""

func _physics_process(_delta):
	movePlayer()
	animatePlayer()
	
	#If the owl is touched
	if Global.changephase:
		newgame()
	
	#If the game ends
	if Global.endgame:
		endgame()
	
	move_and_slide()

func endgame():
	queue_free()

func newgame():
	position.x = 50
	position.y = 150

func movePlayer():
	velocity.x=0
	velocity.y=0
	
	#If the player 2 is the lion
	if Global.player1isowl:
		if Input.is_action_pressed("right-D"):
			velocity.x = Global.lionspeed
		elif Input.is_action_pressed("left-A"):
			velocity.x = -Global.lionspeed
		if Input.is_action_pressed("down-S"):
			velocity.y = Global.lionspeed
		elif Input.is_action_pressed("up-W"):
			velocity.y = -Global.lionspeed
	else: #If the player 1 is the lion
		if Input.is_action_pressed("right"):
			velocity.x = Global.lionspeed
		elif Input.is_action_pressed("left"):
			velocity.x = -Global.lionspeed
		if Input.is_action_pressed("down"):
			velocity.y = Global.lionspeed
		elif Input.is_action_pressed("up"):
			velocity.y = -Global.lionspeed

func animatePlayer():
	stringanimation = "RESET"
	if velocity.x>0:
		stringanimation = "walkright"
	elif velocity.x<0:
		stringanimation = "walkleft"
	
	if velocity.y>0:
		stringanimation = "walkdown"
	elif velocity.y<0:
		stringanimation = "walkup"
	
	animationsprite.play(stringanimation)
