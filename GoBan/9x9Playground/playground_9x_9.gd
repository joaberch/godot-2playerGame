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

func _on_stone_position_mouse_entered():
	$stonePosition/A1/Sprite2D.visible = true


func _on_a_1_mouse_entered():
	if checkIsBlackTurn:
		$Goban9x9/A1/CollisionShape2D/black.visible = true
	else:
		$Goban9x9/A1/CollisionShape2D/white.visible = true


func _on_a_1_mouse_exited():
	if checkIsBlackTurn:
		$Goban9x9/A1/CollisionShape2D/black.visible = false
	else:
		$Goban9x9/A1/CollisionShape2D/white.visible = false

func _on_a_2_mouse_entered():
	if checkIsBlackTurn:
		$Goban9x9/A2/CollisionShape2D/black.visible = true
	else:
		$Goban9x9/A2/CollisionShape2D/white.visible = true


func _on_a_2_mouse_exited():
	if checkIsBlackTurn:
		$Goban9x9/A2/CollisionShape2D/black.visible = false
	else:
		$Goban9x9/A2/CollisionShape2D/white.visible = false


func _on_a_3_mouse_entered():
	if checkIsBlackTurn:
		$Goban9x9/A3/CollisionShape2D/black.visible = true
	else:
		$Goban9x9/A3/CollisionShape2D/white.visible = true


func _on_a_3_mouse_exited():
	if checkIsBlackTurn:
		$Goban9x9/A3/CollisionShape2D/black.visible = false
	else:
		$Goban9x9/A3/CollisionShape2D/white.visible = false
