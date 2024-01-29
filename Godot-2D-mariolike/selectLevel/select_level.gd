extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_1_pressed():
	get_tree().change_scene_to_file(Global.sceneminigame1)

func _on_button_2_pressed():
	get_tree().change_scene_to_file(Global.sceneminigame2)

func _on_button_3_pressed():
	get_tree().change_scene_to_file(Global.sceneminigame3)

func _on_button_4_pressed():
	get_tree().change_scene_to_file(Global.sceneminigame4)

func _on_button_pressed():
	get_tree().change_scene_to_file(Global.scenehomeMenu)

func _on_minigame_5_pressed():
	get_tree().change_scene_to_file(Global.sceneminigame5)
