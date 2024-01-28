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
		$Sprite2D.visible = true
		$ShurikenInverted.visible = false
		checkIsShootByKnight = true
	else:
		position.x = Global.goldKnightPositionx
		position.y = Global.goldKnightPositiony
		$Sprite2D.visible = false
		$ShurikenInverted.visible = true
		checkIsShootByKnight = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delt = delta
	moveShuriken()
	checkBorder()
	rotateShuriken()

func rotateShuriken():
	if checkIsShootByKnight:
		if directionKnight == "right":
			rotation+=0.1
		elif directionKnight == "left":
			rotation-=0.1
		elif directionKnight == "up":
			rotation-=0.1
		else:
			rotation-=0.1
	else:
		if directionGoldKnight == "right":
			rotation+=0.1
		elif directionGoldKnight == "left":
			rotation-=0.1
		elif directionGoldKnight == "up":
			rotation-=0.1
		else:
			rotation-=0.1


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
	if area.name == "hitboxShuriken" || area.name == "flamHitbox" || area.name == "plantHitbox" || area.name == "frogHitbox":
		queue_free()
	
	if checkIsShootByKnight:
		if area.name == "hitboxGoldKnight":
			Global.goldKnightDamageTaken += 1
			queue_free()
	else:
		if area.name == "hitboxKnight":
			Global.knightDamageTaken += 1
			queue_free()
