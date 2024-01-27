extends Node

var checkIsBlackTurn = true

var played = []

var blackPlayed = []
var whitePlayed = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update():
	updateMove()
	checkTake()

func checkTake():
	pass

func updateMove():
	blackPlayed = []
	whitePlayed = []
	
	for i in range(played.size()):
		if i%2 == 0:
			blackPlayed.append(played[i])
		else:
			whitePlayed.append(played[i])
			
	print("black : " )
	print(blackPlayed)
	print("white : ")
	print(whitePlayed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
