extends Node2D

@onready var timer : Timer = $gameTimer
@onready var label : Label = $Label
@onready var player1win = $player1win
@onready var player2win = $player2win
@onready var GameEndSound = $GameEnd
@onready var endTimer = $WaitingAtTheEnd

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()  # Le timer déclenchera le signal "timeout" toutes les secondes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	label.text = str(round(timer.time_left))

func _on_timer_timeout(): #At the end of the 
	Global.endgame = true
	GameEndSound.play()
	label.visible = false
	$owl.visible = false
	$cat.visible = false
	$lion.visible = false
	if Global.player1isowl:
		player1win.visible = true
	else:
		player2win.visible = true
	endTimer.start()


func _on_waiting_at_the_end_timeout():
	get_tree().change_scene_to_file(Global.scenerandomChoose)
