extends StaticBody2D

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
			Global.update()
			checkHasBeenMarked = true
			
			# Toggle turn
			Global.checkIsBlackTurn = !Global.checkIsBlackTurn

func _on_hitbox_mouse_entered():
	checkIsInside = true
	if !checkHasBeenMarked:
		if Global.checkIsBlackTurn:
			$hitbox/hitbox/black.visible = true
		else:
			$hitbox/hitbox/white.visible = true

func _on_hitbox_mouse_exited():
	checkIsInside = false
	if !checkHasBeenMarked:
		if Global.checkIsBlackTurn:
			$hitbox/hitbox/black.visible = false
		else:
			$hitbox/hitbox/white.visible = false
