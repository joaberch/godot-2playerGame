extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame
func _process(_delta):
	if Input.is_action_just_pressed("mouse_click"):
		var mouse_pos = get_local_mouse_position()
		
		#Getting the coordinate of the button play
		var rect = get_rect() #Get the border of the object
		var rect_min = rect.position #Get the top left position
		var rect_max = rect.position + rect.size #Get the bottom right position
		
		#if the play click inside the button
		if (mouse_pos.x >= rect_min.x && mouse_pos.x <= rect_max.x && mouse_pos.y >= rect_min.y && mouse_pos.y <= rect_max.y):
			play()

func play():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().root.add_child(Global.SelectionMenu1)
	
