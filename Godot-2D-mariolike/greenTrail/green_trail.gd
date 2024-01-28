extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if !Global.checkGreenSnakeIsAlive:
		visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.checkGreenSnakeIsAlive:
		queue_free()
