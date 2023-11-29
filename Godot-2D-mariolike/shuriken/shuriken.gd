extends RigidBody2D

var checkGoingLeft
var checkIsShootByKnight

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.checkIsKnight:
		position.x = Global.knightpositionx
		position.y = Global.knightpositiony
		checkIsShootByKnight = true
		
		if Global.goldKnightPositionx<global_position.x:
			checkGoingLeft = true
		else:
			checkGoingLeft = false
	else:
		position.x = Global.goldKnightPositionx
		position.y = Global.goldKnightPositiony
		checkIsShootByKnight = false
		
		if Global.knightpositionx<global_position.x:
			checkGoingLeft = true
		else:
			checkGoingLeft = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (checkGoingLeft):
		position.x += -(delta*100)
	else:
		position.x += (delta*100)

func _on_hitbox_shuriken_area_entered(area):
	print("test")


func _on_hitbox_shuriken_body_entered(body):
	if body.has_method("player"):
		print("body detected")
