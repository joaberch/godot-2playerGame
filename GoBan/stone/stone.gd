extends Area2D

var checkHasBeenMarked = false
var checkIsInside = false
var thisName = name

# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta("name", name)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		if !checkHasBeenMarked && checkIsInside:
			# Perform actions only if the area has not been marked
			Global.played.append(get_meta("name"))
			Global.updateMove()
			checkHasBeenMarked = true
			
			# Toggle turn
			Global.checkIsBlackTurn = !Global.checkIsBlackTurn

# Called when the mouse enters the area.
func _on_mouse_entered():
	checkIsInside = true
	if !checkHasBeenMarked:
		if Global.checkIsBlackTurn:
			$CollisionShape2D/black.visible = true
		else:
			$CollisionShape2D/white.visible = true

# Called when the mouse exits the area.
func _on_mouse_exited():
	checkIsInside = false
	if !checkHasBeenMarked:
		if Global.checkIsBlackTurn:
			$CollisionShape2D/black.visible = false
		else:
			$CollisionShape2D/white.visible = false
