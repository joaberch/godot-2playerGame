extends Node2D

@onready var redSnake = $snakeRed
@onready var greenSnake = $snakeGreen

@onready var redTrailScene = preload("res://redTrail/red_trail.tscn")
@onready var greenTrailScene = preload("res://greenTrail/green_trail.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	createTrail()

func createTrail():
	createRedTrail()
	createGreenTrail()

func createGreenTrail():
	var newTrail = greenTrailScene.instantiate()
	add_child(newTrail)
	if greenSnake.velocity.x > 0:
		newTrail.position = Vector2(greenSnake.position.x-20, greenSnake.position.y)
	elif greenSnake.velocity.x < 0:
		newTrail.position = Vector2(greenSnake.position.x+20, greenSnake.position.y)
	elif greenSnake.velocity.y > 0:
		newTrail.position = Vector2(greenSnake.position.x, greenSnake.position.y-20)
	elif greenSnake.velocity.y < 0:
		newTrail.position = Vector2(greenSnake.position.x, greenSnake.position.y+20)
	else:
		print("Error in the red trail")

func createRedTrail():
	var newTrail = redTrailScene.instantiate()
	add_child(newTrail)
	if redSnake.velocity.x > 0:
		newTrail.position = Vector2(redSnake.position.x-20, redSnake.position.y)
	elif redSnake.velocity.x < 0:
		newTrail.position = Vector2(redSnake.position.x+20, redSnake.position.y)
	elif redSnake.velocity.y > 0:
		newTrail.position = Vector2(redSnake.position.x, redSnake.position.y-20)
	elif redSnake.velocity.y < 0:
		newTrail.position = Vector2(redSnake.position.x, redSnake.position.y+20)
	else:
		print("Error in the red trail")
