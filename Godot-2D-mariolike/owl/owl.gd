extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer

func _physics_process(_delta):
	animatePlayer()
	movePlayer()
	GetValue()
	
	#If the owl is touched we change the phases
	if Global.changephase:
		newgame()
	
	#If the timer runs out
	if Global.endgame:
		queue_free()
	
	move_and_slide()

func GetValue():
	Global.playerpositionx = global_position.x
	Global.playerpositiony = global_position.y

func animatePlayer():
	if Input.is_action_pressed("left"):
		animations.play("left")
	elif Input.is_action_pressed("right"):
		animations.play("right")
	else:
		animations.play("up")

func movePlayer():
	# Get the input direction and handle the movement
	velocity.x=0
	velocity.y=0
	if Input.is_action_pressed("right"):
		velocity.x = Global.owlspeed
	elif Input.is_action_pressed("left"):
		velocity.x = -Global.owlspeed
	
	if Input.is_action_pressed("down"):
		velocity.y = Global.owlspeed
	elif Input.is_action_pressed("up"):
		velocity.y = -Global.owlspeed


func _on_hurtbox_area_entered(area):
	if area.name == "enemyhitbox":
		#queue_free() #player die
		
		#Start a new game
		Global.changephase = true

func newgame():
	position.x = 1100
	position.y = 600

func endgame():
	pass
