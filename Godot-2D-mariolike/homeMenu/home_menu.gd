extends Node2D

@onready var buttonGame1 = $TileMap/Minigame1/Button1
@onready var buttonGame2 = $TileMap/Minigame2/Button2
@onready var buttonGame3 = $TileMap/Minigame3/Button3
@onready var miniGame1 = $TileMap/Minigame1
@onready var miniGame2 = $TileMap/Minigame2
@onready var miniGame3 = $TileMap/Minigame3

# Called when the node enters the scene tree for the first time.
func _ready():
	checkWinner()
	
	if Global.minigame1winner:
		buttonGame1.disabled = true
	if Global.minigame2winner:
		buttonGame2.disabled = true
	if Global.minigame3winner:
		buttonGame3.disabled = true
	
	#Display the winner of the minigame played
	#Minigame 1
	if Global.minigame1winner == 1:
		$TileMap/Minigame1/Minigame1Winner/Game1Player1win.visible = true
	if Global.minigame1winner == 2:
		$TileMap/Minigame1/Minigame1Winner/Game1Player2win.visible = true
	#Minigame 2
	if Global.minigame2winner == 1:
		$TileMap/Minigame2/Minigame2Winner/Game2Player1win.visible = true
	if Global.minigame2winner == 2:
		$TileMap/Minigame2/Minigame2Winner/Game2Player2win.visible = true
	#Minigame 3
	if Global.minigame3winner == 1:
		$TileMap/Minigame3/Minigame3Winner/Game3Player1win.visible = true
	if Global.minigame3winner == 2:
		$TileMap/Minigame3/Minigame3Winner/Game3Player2win.visible = true
	
	#Starting the animation
	$TileMap/Minigame1/owlSprite/AnimationPlayer.play("right")
	$TileMap/Minigame1/lionSprite/AnimationPlayer.play("left")
	$TileMap/Minigame1/catSprite/AnimationPlayer.play("left")
	
	$TileMap/Minigame2/Frog1/AnimationPlayer.play("right")
	$TileMap/Minigame2/Frog2/AnimationPlayer.play("left")
	$TileMap/Minigame2/knight2/AnimationPlayer.play("left")
	$TileMap/Minigame2/knight1/AnimationPlayer.play("right")

func checkWinner():
	if (Global.minigame1winner == 1 && Global.minigame2winner == 1) || (Global.minigame1winner == 1 && Global.minigame3winner == 1) || (Global.minigame2winner == 1 && Global.minigame3winner == 1):
		print("player 1 won")
		miniGame1.queue_free()
		miniGame2.queue_free()
		miniGame3.queue_free()
		$TileMap.clear_layer(1)
		$TileMap.clear_layer(2)
		$Player1Won.visible = true
		$WinAudio.play()
	if (Global.minigame1winner == 2 && Global.minigame2winner == 2) || (Global.minigame1winner == 2 && Global.minigame3winner == 2) || (Global.minigame2winner == 2 && Global.minigame3winner == 2):
		print("player 2 won")
		miniGame1.queue_free()
		miniGame2.queue_free()
		miniGame3.queue_free()
		$TileMap.clear_layer(1)
		$TileMap.clear_layer(2)
		$Player2Won.visible = true
		$WinAudio.play()

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
