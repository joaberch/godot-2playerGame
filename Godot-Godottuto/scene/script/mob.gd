extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#Getting one of the three random animation
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])

func isOnScrren():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
