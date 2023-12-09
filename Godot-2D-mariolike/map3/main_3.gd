extends Node2D

@onready var camera = $Camera2D
@onready var timerCameraspeed2 = $TimerCameraSpeed2
@onready var rightBorder = $rightBorder
@onready var leftBorder = $leftLimit
@onready var player1win = $player1win
@onready var player2win = $player2win
var cameraSpeed = 1
var CheckDeadPlayer1
var CheckDeadPlayer2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.offset.x += cameraSpeed
	rightBorder.position.x += cameraSpeed
	leftBorder.position.x += cameraSpeed
	
	if Global.minigame3winner == 1:
		player1win.position.x = camera.offset.x + 450
		player1win.visible = true
	if Global.minigame3winner == 2:
		player2win.visible = true
		player2win.position.x = camera.offset.x + 450
	
	if Global.checkDeadPlayer1 == true && Global.checkDeadPlayer2 == true:
		get_tree().change_scene_to_file(Global.scenehomeMenu)

func _on_timer_before_camera_move_timeout():
	timerCameraspeed2.start()


func _on_timer_camera_speed_2_timeout():
	cameraSpeed += 0.1
	
