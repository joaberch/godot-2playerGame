extends Sprite2D
# Le rayon de clic pour détecter si l'ennemi a été cliqué
var click_radius = 25.0

func _process(_delta):
	# Vérifiez si l'ennemi a été cliqué
	if Input.is_action_just_pressed("mouse_click"):
		var mouse_pos = get_global_mouse_position()
		if position.distance_to(mouse_pos) < click_radius:
			kill()  # Tuez l'ennemi s'il est cliqué
			respawn() #Respawn un ennemi

func kill():
	# Cette fonction sera appelée pour tuer l'ennemi
	queue_free()  # Détruisez l'ennemi
	Global.score += 1

func respawn():
	# Cette fonction sera appelée pour réapparaître l'ennemi
	var new_position = Vector2(randi() % int(get_viewport_rect().size.x), randi() % int(get_viewport_rect().size.y))
	position = new_position
