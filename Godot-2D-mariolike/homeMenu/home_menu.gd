extends Node2D

#TODO : frog can't move when attack | restart button
@onready var buttonGame1 = $TileMap/Minigame1/Button1
@onready var buttonGame2 = $TileMap/Minigame2/Button2
@onready var buttonGame3 = $TileMap/Minigame3/Button3
@onready var miniGame1 = $TileMap/Minigame1
@onready var miniGame2 = $TileMap/Minigame2
@onready var miniGame3 = $TileMap/Minigame3

# Called when the node enters the scene tree for the first time.
func _ready():
	#Animate characters
	animateCharacter()

func animateCharacter():
	#Starting the animation
	$TileMap/Minigame1/owlSprite/AnimationPlayer.play("right")
	$TileMap/Minigame1/lionSprite/AnimationPlayer.play("left")
	$TileMap/Minigame1/catSprite/AnimationPlayer.play("left")
	
	$TileMap/Minigame2/Frog1/AnimationPlayer.play("right")
	$TileMap/Minigame2/Frog2/AnimationPlayer.play("left")
	$TileMap/Minigame2/knight2/AnimationPlayer.play("left")
	$TileMap/Minigame2/knight1/AnimationPlayer.play("right")

func _on_button_1_pressed():
	buttonGame1.disabled = true
	buttonGame2.disabled = true
	buttonGame3.disabled = true
	#get_tree().root.add_child(Global.sceneminigame1)
	get_tree().change_scene_to_file(Global.sceneminigame1)


func _on_button_2_pressed():
	buttonGame2.disabled = true
	buttonGame1.disabled = true
	buttonGame3.disabled = true
	get_tree().change_scene_to_file(Global.sceneminigame2)


func _on_button_3_pressed():
	buttonGame1.disabled = true
	buttonGame2.disabled = true
	buttonGame3.disabled = true
	get_tree().change_scene_to_file(Global.sceneminigame3)


func _on_random_pressed():
	get_tree().change_scene_to_file(Global.scenerandomChoose)
