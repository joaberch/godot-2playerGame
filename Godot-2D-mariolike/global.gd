extends Node

############################################ Scene #######################
@onready var sceneminigame1 = "res://map/main.tscn"
@onready var scenehomeMenu = "res://homeMenu/home_menu.tscn"
@onready var sceneminigame2 = "res://map2/main_2.tscn"
@onready var sceneminigame3 = "res://map3/main_3.tscn"
@onready var sceneminigame4 = "res://map4/main_4.tscn"
@onready var scenerandomChoose = "res://chooseRandom/choose_random.tscn"

#################################### Mini Game 1 Variable ########################
var owlspeed = 500
@export var catspeed = 250
@export var lionspeed = 400

var playerpositionx
var playerpositiony
var changephase = false
var endgame = false
var player1isowl = true

################################### Mini Game 2 Variable #######################

@export var knightspeed = 400
@export var goldknightspeed = 400
var knightpositionx
var knightpositiony
var shurikencooldown = 1.5

var knightDamageTaken = 0
var goldKnightDamageTaken = 0

var goldKnightPositionx
var goldKnightPositiony
@export var greenFrogVelocity = 200
@export var redFrogVelocity = 200
@export var ShurikenVelocity = 200
@export var flameVelocity = 10
@export var plantBulletVelocity = 10
@export var redFrogLifePoint = 50
@export var greenFrogLifePoint = 50

var checkGreenFrogIsAlive = true
var checkRedFrogIsAlive = true
var checkGreenFrogCanAttack = true
var checkRedFrogCanAttack = true

var checkIsKnight
var knightDirection = "down"
var goldKnightDirection = "down"

var checkFrogAreAttacking

var greenFrogPosition
var redFrogPosition

################################### Mini Game 3 Variable
@export var redFishVelocity = 50
@export var pinkFishVelocity = 50

var checkDeadPlayer1
var checkDeadPlayer2

################################### Minigame 4 Variable 
@export var redSnakeVelocity = 250
@export var greenSnakeVelocity = 250

#################################### Game variable ##############################

#var minigame1winner
#var minigame2winner
#var minigame3winner

##################################### Function #############################

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if changephase:
		changephase = false
