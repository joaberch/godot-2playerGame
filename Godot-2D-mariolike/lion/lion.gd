extends CharacterBody2D

@onready var animationsprite = $SpriteSheet/AnimationPlayer
@onready var player1 = $Player1
@onready var player2 = $Player2
var checkslow = 1
var stringanimation = ""

func _physics_process(_delta):
	movePlayer()
	animatePlayer()
	playerName()
	
	#If the owl is touched
	if Global.changephase:
		newgame()
	
	move_and_slide()

func playerName():
	if Global.player1isowl:
		player1.region_enabled = true
		player2.region_enabled = false
	else:
		player1.region_enabled = false
		player2.region_enabled = true

func newgame():
	position.x = 50
	position.y = 150

func movePlayer():
	velocity.x=0
	velocity.y=0
	
	#If the player 2 is the lion
	if Global.player1isowl:
		if Input.is_action_pressed("right-D"):
			velocity.x = (Global.lionspeed / checkslow)
		elif Input.is_action_pressed("left-A"):
			velocity.x = -(Global.lionspeed / checkslow)
		if Input.is_action_pressed("down-S"):
			velocity.y = (Global.lionspeed / checkslow)
		elif Input.is_action_pressed("up-W"):
			velocity.y = -(Global.lionspeed / checkslow)
	else: #If the player 1 is the lion
		if Input.is_action_pressed("right"):
				velocity.x = (Global.lionspeed / checkslow)
		elif Input.is_action_pressed("left"):
			velocity.x = -(Global.lionspeed / checkslow)
		if Input.is_action_pressed("down"):
			velocity.y = (Global.lionspeed / checkslow)
		elif Input.is_action_pressed("up"):
			velocity.y = -(Global.lionspeed / checkslow)

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



func _on_footdetection_area_entered(area):
	if area.name == "slow":
		checkslow = 2


func _on_footdetection_area_exited(area):
	if area.name == "slow":
		checkslow = 1
