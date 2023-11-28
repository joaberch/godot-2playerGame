extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.checkIsKnight:
		position.x = Global.knightpositionx
		position.y = Global.knightpositiony
	else:
		position.x = Global.goldKnightPositionx
		position.y = Global.goldKnightPositiony


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = -(delta*100)+position.y
