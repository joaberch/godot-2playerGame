extends CharacterBody2D

@onready var animationSprite = $AnimatedSprite2D

var stringAnimation = "right"
var direction = "R"

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
			velocity.x = Global.greenSnakeVelocity
			stringAnimation = 'right'
		'L':
			velocity.x = -Global.greenSnakeVelocity
			stringAnimation = 'left'
		'D':
			velocity.y = Global.greenSnakeVelocity
			stringAnimation = 'down'
		'U':
			velocity.y = -Global.greenSnakeVelocity
			stringAnimation = 'up'

func checkInput():
	if Input.is_action_pressed("right-D"):
		direction = "R"
	elif Input.is_action_pressed("left-A"):
		direction = "L"
	if Input.is_action_pressed("down-S"):
		direction = "D"
	elif Input.is_action_pressed("up-W"):
		direction = "U"
