extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#Animate characters
	animateCharacter()

func animateCharacter():
	#Starting the animation
	var owlAnimation = $Control/TileMap/Minigame1/owlSprite/AnimationPlayer
	var lionAnimation = $Control/TileMap/Minigame1/lionSprite/AnimationPlayer
	var catAnimation = $Control/TileMap/Minigame1/catSprite/AnimationPlayer
	var frog1Animation = $Control/TileMap/Minigame2/Frog1/AnimationPlayer
	var frog2Animation = $Control/TileMap/Minigame2/Frog2/AnimationPlayer
	var knight1Animation = $Control/TileMap/Minigame2/knight1/AnimationPlayer
	var knight2Animation = $Control/TileMap/Minigame2/knight2/AnimationPlayer
	
	owlAnimation.play("right")
	lionAnimation.play("left")
	catAnimation.play("left")
	
	frog1Animation.play("right")
	frog2Animation.play("left")
	knight2Animation.play("left")
	knight1Animation.play("right")

func _on_minigame_1_pressed() -> void:
	get_tree().change_scene_to_file(Global.sceneminigame1)

func _on_minigame_2_pressed() -> void:
	get_tree().change_scene_to_file(Global.sceneminigame2)

func _on_minigame_3_pressed() -> void:
	get_tree().change_scene_to_file(Global.sceneminigame3)

func _on_minigame_4_pressed() -> void:
	get_tree().change_scene_to_file(Global.sceneminigame4)

func _on_minigame_5_pressed() -> void:
	get_tree().change_scene_to_file(Global.sceneminigame5)
