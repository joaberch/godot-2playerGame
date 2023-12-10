extends CharacterBody2D

@onready var ammoscene = preload("res://playerAmmo/ammo.tscn")

func _ready():
	pass

func _process(_delta):
	checkInput()
	getPosition()
	move_and_slide()

func getPosition():
	Global.playerposition = global_position

func checkInput():
	if Input.is_action_pressed("up"):
		position.y -= Global.spaceShipSpeed
	if Input.is_action_pressed("down"):
		position.y += Global.spaceShipSpeed
	if Input.is_action_pressed("left"):
		position.x -= Global.spaceShipSpeed
	if Input.is_action_pressed("right"):
		position.x += Global.spaceShipSpeed
	if Input.is_action_just_pressed("shoot"):
		#TODO : ammo.init(Gloal_position)
		var ammo = ammoscene.instantiate()
		get_parent().add_child(ammo)
