extends CharacterBody2D

@onready var animationSprite = $AnimatedSprite2D

var stringAnimation = "left"
var direction = "L"

func _ready():
	animationSprite.play(stringAnimation)

func _physics_process(delta):
	moveplayer()
	animationSprite.play(stringAnimation)
	
	move_and_slide()

func moveplayer():
	checkInput()
	velocity = Vector2(0, 0)
	match direction:
		'R':
			velocity.x = Global.redSnakeVelocity
			stringAnimation = 'right'
		'L':
			velocity.x = -Global.redSnakeVelocity
			stringAnimation = 'left'
		'D':
			velocity.y = Global.redSnakeVelocity
			stringAnimation = 'down'
		'U':
			velocity.y = -Global.redSnakeVelocity
			stringAnimation = 'up'

func checkInput():
	if Input.is_action_pressed("right"):
		direction = "R"
	elif Input.is_action_pressed("left"):
		direction = "L"
	if Input.is_action_pressed("down"):
		direction = "D"
	elif Input.is_action_pressed("up"):
		direction = "U"
