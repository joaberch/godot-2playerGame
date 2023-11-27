extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = $"../Knight".global_position.x
	position.y = $"../Knight".global_position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = -(delta*100)+position.y
