extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#Getting one of the three random animation
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PathFollow2D.progress+=250*delta

func get_path_direction(pos):
	var offset = $Path2D.curve.get_closest_offset(pos)
	$Path2D/PathFollow2D.offset = offset
	return $Path2D/PathFollow2D.transform.x
