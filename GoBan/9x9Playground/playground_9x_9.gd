extends Node2D

var white = load("res://art/whiteStone.png")
var black = load("res://art/blackStone.png")

var checkIsBlackTurn = true

# Called when the node enters the scene tree for the first time.
func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	#Input.set_custom_mouse_cursor(black)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

