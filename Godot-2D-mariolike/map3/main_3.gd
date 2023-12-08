extends Node2D

@onready var camera = $Camera2D
@onready var timerCameraspeed2 = $TimerCameraSpeed2
@onready var rightBorder = $rightBorder
@onready var leftBorder = $leftLimit
@onready var player1win = $player1win
@onready var player2win = $player2win
var cameraSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.offset.x += cameraSpeed/10
	rightBorder.position.x += cameraSpeed/10
	leftBorder.position.x += cameraSpeed/10
	
	if Global.minigame3winner == 1:
		player1win.position.x = camera.offset.x + 450
		player1win.visible = true
	if Global.minigame3winner == 2:
		player2win.visible = true
		player2win.position.x = camera.offset.x + 450

func _on_timer_before_camera_move_timeout():
	timerCameraspeed2.start()


func _on_timer_camera_speed_2_timeout():
	cameraSpeed += 0.001
	
