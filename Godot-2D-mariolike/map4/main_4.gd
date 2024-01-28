extends Node2D

@onready var redSnake = $snakeRed
@onready var greenSnake = $snakeGreen
@onready var textWin1 = $player1win
@onready var textWin2 = $player2win
@onready var timer = $TimerReturn

@onready var redTrailScene = preload("res://redTrail/red_trail.tscn")
@onready var greenTrailScene = preload("res://greenTrail/green_trail.tscn")

var checkTimerIsRunning

# Called when the node enters the scene tree for the first time.
func _ready():
	redSnake.position = Vector2(1100, 325)
	greenSnake.position = Vector2(30, 325)
	redSnake.visible = true
	greenSnake.visible = true
	Global.checkRedSnakeIsAlive = true
	Global.checkGreenSnakeIsAlive = true
	textWin1.visible = false
	textWin2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	createTrail()
	displayWinner()

func displayWinner():
	if !Global.checkRedSnakeIsAlive && Global.checkGreenSnakeIsAlive:
		textWin2.visible = true
		if !checkTimerIsRunning:
			timer.start()
		checkTimerIsRunning = true
	elif Global.checkRedSnakeIsAlive && !Global.checkGreenSnakeIsAlive:
		textWin1.visible = true
		if !checkTimerIsRunning:
			timer.start()
		checkTimerIsRunning = true
	elif !Global.checkRedSnakeIsAlive && !Global.checkGreenSnakeIsAlive:
		pass

func createTrail():
	createRedTrail()
	createGreenTrail()

func createGreenTrail():
	var newTrail = greenTrailScene.instantiate()
	add_child(newTrail)
	if greenSnake.velocity.x > 0:
		newTrail.position = Vector2(greenSnake.position.x-25, greenSnake.position.y)
	elif greenSnake.velocity.x < 0:
		newTrail.position = Vector2(greenSnake.position.x+25, greenSnake.position.y)
	elif greenSnake.velocity.y > 0:
		newTrail.position = Vector2(greenSnake.position.x, greenSnake.position.y-25)
	elif greenSnake.velocity.y < 0:
		newTrail.position = Vector2(greenSnake.position.x, greenSnake.position.y+25)
	else:
		print("Error in the red trail")

func createRedTrail():
	var newTrail = redTrailScene.instantiate()
	add_child(newTrail)
	if redSnake.velocity.x > 0:
		newTrail.position = Vector2(redSnake.position.x-25, redSnake.position.y)
	elif redSnake.velocity.x < 0:
		newTrail.position = Vector2(redSnake.position.x+25, redSnake.position.y)
	elif redSnake.velocity.y > 0:
		newTrail.position = Vector2(redSnake.position.x, redSnake.position.y-25)
	elif redSnake.velocity.y < 0:
		newTrail.position = Vector2(redSnake.position.x, redSnake.position.y+25)
	else:
		print("Error in the red trail")

func _on_timer_return_timeout():
	get_tree().change_scene_to_file(Global.scenehomeMenu)
