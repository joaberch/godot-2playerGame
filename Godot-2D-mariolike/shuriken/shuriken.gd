extends RigidBody2D

var checkIsShootByKnight
var directionKnight = Global.knightDirection
var directionGoldKnight = Global.goldKnightDirection
var checkGoingLeft
var delt
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
	delt = delta
	moveShuriken()
	checkBorder()
	
#Delete the shuriken if it goes too far
func checkBorder():
	if position.x > 2000 || position.x < -100 || position.y < -100 || position.y > 1000:
		queue_free()

func moveShuriken():
	if checkIsShootByKnight:
		if directionKnight == "left":
			position.x += -(delt*100)
		elif directionKnight == "right":
			position.x += (delt*100)
		elif directionKnight == "up":
			position.y += -(delt*100)
		elif directionKnight == "down":
			position.y +=  (delt*100)
	else:
		if directionGoldKnight == "left":
			position.x += -(delt*100)
		elif directionGoldKnight == "right":
			position.x += (delt*100)
		elif directionGoldKnight == "up":
			position.y += -(delt*100)
		elif directionGoldKnight == "down":
			position.y +=  (delt*100)

func _on_hitbox_shuriken_area_entered(area):
	if area.name == "hitboxShuriken":
		queue_free()
	if checkIsShootByKnight:
		if area.name == "hitbox":
			print("gold Knight Touched")
	else:
		if area.name == "hitbox":
			print("knight has been touched")
	print("shuriken has entered an area")
