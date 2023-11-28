extends Node

############################################ Scene #######################
@onready var sceneminigame1 = "res://map/main.tscn"
@onready var scenehomeMenu = "res://homeMenu/home_menu.tscn"
@onready var sceneminigame2 = "res://map2/main_2.tscn"

#################################### Mini Game 1 Variable ########################
@export var owlspeed = 500
@export var catspeed = 250
@export var lionspeed = 400
@export var timer = 60 #Timer before the game ends

var playerpositionx
var playerpositiony
var changephase = false
var endgame = false
var timeremaining : int
var player1isowl = true

################################### Mini Game 2 Variable #######################

@export var knightspeed = 400
@export var goldknightspeed = 400
var knightpositionx
var knightpositiony

var goldKnightPositionx
var goldKnightPositiony
@export var greenFrogVelocity = 200
@export var redFrogVelocity = 200
@export var ShurikenVelocity = 200

var checkIsKnight

#################################### Game variable ##############################

var minigame1winner
var minigame2winner

##################################### Function #############################

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if changephase:
		changephase = false
