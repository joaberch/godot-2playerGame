extends Node2D

@onready var timer : Timer = $gameTimer
@onready var label : Label = $Label
@onready var player1win = $player1win
@onready var player2win = $player2win
@onready var GameEndSound = $GameEnd
@onready var endTimer = $WaitingAtTheEnd

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = Global.timer
	timer.start()  # Le timer déclenchera le signal "timeout" toutes les secondes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Global.timeremaining = timer.time_left
	label.text = str(Global.timeremaining)

func _on_timer_timeout(): #At the end of the 
	Global.endgame = true
	GameEndSound.play()
	label.visible = false
	if Global.player1isowl:
		player1win.visible = true
		Global.minigame1winner = 1
	else:
		player2win.visible = true
		Global.minigame1winner = 2
	endTimer.start()


func _on_waiting_at_the_end_timeout():
	get_tree().change_scene_to_file(Global.scenehomeMenu)
