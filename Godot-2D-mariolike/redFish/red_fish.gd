extends CharacterBody2D

func _physics_process(_delta):
	#Check if the player has pressed an input
	CheckInput()
	#Make the fish look in the direction it is going (TODO : polish)
	look_at(velocity*-velocity*velocity)
	#Moving/sliding
	move_and_slide()

func _ready():
	velocity.x = Global.redFishVelocity

func CheckInput():
	#Moving to the left
	if Input.is_action_just_pressed("left"):
		velocity.x -= Global.redFishVelocity
	#Moving to the right
	if Input.is_action_just_pressed("right"):
		velocity.x += Global.redFishVelocity
	#Moving upward
	if Input.is_action_just_pressed("up"):
		velocity.y -= Global.redFishVelocity
	#Moving bottomward
	if Input.is_action_just_pressed("down"):
		velocity.y += Global.redFishVelocity


func _on_red_fish_hitbox_area_entered(area):
	if area.name == "leftLimit":
		queue_free()
		Global.checkDeadPlayer1 = true
