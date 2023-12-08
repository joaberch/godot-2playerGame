extends Node2D

@onready var camera = $Camera2D
@onready var timerCameraspeed2 = $TimerCameraSpeed2
@onready var rightBorder = $rightBorder
var cameraSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.offset.x += cameraSpeed/10
	rightBorder.position.x += cameraSpeed/10

func _on_timer_before_camera_move_timeout():
	timerCameraspeed2.start()


func _on_timer_camera_speed_2_timeout():
	cameraSpeed += 0.001
	
