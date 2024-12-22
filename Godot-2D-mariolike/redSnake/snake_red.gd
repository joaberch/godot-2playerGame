extends CharacterBody2D

@onready var animationSprite = $AnimatedSprite2D
@onready var trailScene = preload("res://redTrail/red_trail.tscn")

var stringAnimation = "left"
var direction = "L"

func _ready():
	animationSprite.play(stringAnimation)

func _physics_process(delta):
	moveplayer()
	animationSprite.play(stringAnimation)
	
	endOfTheGame()
	
	move_and_slide()

func endOfTheGame():
	if !Global.checkRedSnakeIsAlive:
		visible = false

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
	if Input.is_action_pressed("right") && direction != "L":
		direction = "R"
	elif Input.is_action_pressed("left") && direction != "R":
		direction = "L"
	if Input.is_action_pressed("down") && direction != "U":
		direction = "D"
	elif Input.is_action_pressed("up") && direction != "D":
		direction = "U"

func _on_hitbox_area_entered(area):
	if area.name == "trailHitbox":
		Global.checkRedSnakeIsAlive = false
