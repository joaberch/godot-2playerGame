extends CharacterBody2D

@export var SPEED = 10.0
var screen_size = get_viewport_rect().size
@onready var animations = $AnimatedSprite2D

func _physics_process(_delta):
	CheckInput()
	CheckBorder()
	AnimatePlayer()
	#Moving/sliding
	move_and_slide()

func CheckInput():
	#Moving to the left
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
	#Moving to the right
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED
	#Moving upward
	if Input.is_action_pressed("Up"):
		velocity.y -= SPEED
	#Moving bottomward
	if Input.is_action_pressed("Down"):
		velocity.y += SPEED

func CheckBorder():
	#Teleporting the player to the other side of the game
	if position.x <= 0: #If he's going to the left he spawn to the right
		position.x = 1180
	elif position.x >= 1180: #If he's going to the right he spawn to the left
		position.x=0
	if position.y <=0: #If he's going up he spawn to the bottom
		position.y=650
	elif position.y>=650: #If he's going down he spawn upward
		position.y=0

func AnimatePlayer():
	#Animate the player
	if velocity.x == 0 && velocity.y == 0:
		animations.stop()
	if velocity.y!=0 && abs(velocity.y)>abs(velocity.x):
		if velocity.y < 0:
			animations.play("up")
			animations.flip_v = false
		else:
			animations.play("up")
			animations.flip_v = true
		
	elif velocity.x !=0:
		if velocity.x > 0:
			animations.play("walk")
			animations.flip_h = false
		else:
			animations.play("walk")
			animations.flip_h = true
