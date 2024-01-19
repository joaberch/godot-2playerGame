extends CharacterBody2D

func _physics_process(_delta):
	#Check if the player has pressed an input
	CheckInput()
	#Make the fish look in the direction it is going (TODO : polish)
	look_at (velocity*-velocity*velocity)
	#Moving/sliding
	move_and_slide()

func _ready():
	velocity.x = Global.pinkFishVelocity

func CheckInput():
	#Moving to the left
	if Input.is_action_just_pressed("left-A"):
		velocity.x -= Global.pinkFishVelocity
	#Moving to the right
	if Input.is_action_just_pressed("right-D"):
		velocity.x += Global.pinkFishVelocity
	#Moving upward
	if Input.is_action_just_pressed("up-W"):
		velocity.y -= Global.pinkFishVelocity
	#Moving bottomward
	if Input.is_action_just_pressed("down-S"):
		velocity.y += Global.pinkFishVelocity


func _on_pink_fish_hitbox_area_entered(area):
	if area.name == "leftLimit":
		queue_free()
		Global.checkDeadPlayer2 = true
