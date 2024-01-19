extends Node2D

@onready var camera = $Camera2D
@onready var timerCameraspeed2 = $TimerCameraSpeed2
@onready var rightBorder = $Camera2D/rightBorder
@onready var leftBorder = $Camera2D/leftLimit
@onready var player1win = $player1win
@onready var player2win = $player2win
@onready var redFish = $RedFish
@onready var pinkFish = $pinkFish
var cameraSpeed = 0
var CheckDeadPlayer1
var CheckDeadPlayer2
var phaseSpeed = 1
var checkUnzoom
var checkZoomAgain
var cameraZoom = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Making the left and right border move
	moveBorder()
	#Making the camera move
	moveCamera()
	#Check the winner
	checkWinner()
	#check if we shoukd unfocus
	if checkUnzoom:
		unZoom()
	if checkZoomAgain:
		zoomAgain()

func zoomAgain():
	camera.zoom = Vector2(cameraZoom, cameraZoom)
	cameraZoom += 0.001
	
	if camera.zoom >= Vector2(3, 3):
		checkZoomAgain = false

func unZoom():
	camera.zoom = Vector2(cameraZoom, cameraZoom)
	cameraZoom -= 0.0005
	
	if camera.zoom <= Vector2(0.2, 0.2):
		checkUnzoom = false

func checkWinner():
	if !pinkFish:
		player1win.position.x = camera.offset.x + 450
		player1win.visible = true
	if !redFish:
		player2win.visible = true
		player2win.position.x = camera.offset.x + 450
	
	if !pinkFish && !redFish:
		get_tree().change_scene_to_file(Global.scenerandomChoose)

func moveCamera():
	camera.offset.x += cameraSpeed

func moveBorder():
	if checkUnzoom:
		rightBorder.position.x += cameraSpeed*3
		leftBorder.position.x += cameraSpeed/1.6
	else:
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
	print(cameraSpeed)


func _on_camera_un_zoom_area_entered(_area):
	checkUnzoom = true
	cameraSpeed = 3.1

func _on_camera_zoom_area_entered(_area):
	checkZoomAgain = true
	leftBorder.position.x+= 500
