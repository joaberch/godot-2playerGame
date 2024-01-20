extends Area2D

var checkHasBeenMarked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		#checkHasBeenMarked = true
		if Global.checkIsBlackTurn:
			Global.checkIsBlackTurn = false
		else:
			Global.checkIsBlackTurn = true
		
	


func _on_mouse_entered():
	if !checkHasBeenMarked:
		if Global.checkIsBlackTurn:
			$CollisionShape2D/black.visible = true
		else:
			$CollisionShape2D/white.visible = true


func _on_mouse_exited():
	if !checkHasBeenMarked:
		if Global.checkIsBlackTurn:
			$CollisionShape2D/black.visible = false
		else:
			$CollisionShape2D/white.visible = false
