extends Node2D

@onready var camera = $Camera2D
@onready var timerCameraspeed2 = $TimerCameraSpeed2
@onready var rightBorder = $rightBorder
@onready var leftBorder = $leftLimit
@onready var player1win = $player1win
@onready var player2win = $player2win
var cameraSpeed = 0
var CheckDeadPlayer1
var CheckDeadPlayer2
var phaseSpeed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Making the left and right border move
	moveBorder()
	#Making the camera move
	moveCamera()
	#Check the winner
	checkWinner()

func checkWinner():
	if Global.minigame3winner == 1:
		player1win.position.x = camera.offset.x + 450
		player1win.visible = true
	if Global.minigame3winner == 2:
		player2win.visible = true
		player2win.position.x = camera.offset.x + 450
	
	if Global.checkDeadPlayer1 == true && Global.checkDeadPlayer2 == true:
		get_tree().change_scene_to_file(Global.scenehomeMenu)

func moveCamera():
	camera.offset.x += cameraSpeed

func moveBorder():
	rightBorder.position.x += cameraSpeed
	leftBorder.position.x += cameraSpeed

func _on_timer_before_camera_move_timeout():
	timerCameraspeed2.start()
	cameraSpeed = 0.5


func _on_timer_camera_speed_2_timeout():
	match phaseSpeed:
		1:
			cameraSpeed += 0.5
		2:
			cameraSpeed += 1
	
	if cameraSpeed < 2.1:
		phaseSpeed = 1
	elif cameraSpeed < 7:
		phaseSpeed = 2
	
	if cameraSpeed == 7.5:
		camera.zoom = Vector2(0.5, 0.5)
	print(cameraSpeed)
