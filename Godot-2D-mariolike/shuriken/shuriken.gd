extends RigidBody2D

var checkIsShootByKnight
var directionKnight = Global.knightDirection
var directionGoldKnight = Global.goldKnightDirection
var checkGoingLeft
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.checkIsKnight:
		position.x = Global.knightpositionx
		position.y = Global.knightpositiony
		checkIsShootByKnight = true
	else:
		position.x = Global.goldKnightPositionx
		position.y = Global.goldKnightPositiony
		checkIsShootByKnight = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if checkIsShootByKnight:
		if directionKnight == "left":
			position.x += -(delta*100)
		elif directionKnight == "right":
			position.x += (delta*100)
		elif directionKnight == "up":
			position.y += -(delta*100)
		elif directionKnight == "down":
			position.y +=  (delta*100)
	else:
		if directionGoldKnight == "left":
			position.x += -(delta*100)
		elif directionGoldKnight == "right":
			position.x += (delta*100)
		elif directionGoldKnight == "up":
			position.y += -(delta*100)
		elif directionGoldKnight == "down":
			position.y +=  (delta*100)

func _on_hitbox_shuriken_area_entered(area):
	print("test")


func _on_hitbox_shuriken_body_entered(body):
	if body.has_method("player"):
		print("body detected")
