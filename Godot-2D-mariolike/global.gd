extends Node

@export var owlspeed = 500
@export var catspeed = 150
@export var lionspeed = 200

var playerpositionx
var playerpositiony
var newgame = false

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if newgame:
		newgame = false
