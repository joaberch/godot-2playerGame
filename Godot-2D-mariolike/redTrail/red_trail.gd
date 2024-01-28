extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if !Global.checkRedSnakeIsAlive:
		visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.checkRedSnakeIsAlive:
		queue_free()
