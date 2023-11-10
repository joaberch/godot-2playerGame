extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer
const SPEED = 300.0
const JUMP_VELOCITY = -200.0

func _physics_process(delta):
	animatePlayer()
	movePlayer()

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	move_and_slide()

func animatePlayer():
	if Input.is_action_pressed("ui_left"):
		animations.play("left")
	elif Input.is_action_pressed("right"):
		animations.play("right")
	else:
		animations.play("up")

func movePlayer():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity.x=0
	velocity.y=0
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
	
	if Input.is_action_pressed("down"):
		velocity.y = SPEED
	elif Input.is_action_pressed("up"):
		velocity.y = -SPEED
	
