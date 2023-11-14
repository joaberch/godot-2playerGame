extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer

func _physics_process(_delta):
	animatePlayer()
	movePlayer()
	GetValue()
	
	#If the owl is touched we change the phases
	if Global.changephase:
		changephase()
	
	#If the timer runs out
	if Global.endgame:
		queue_free()
	
	move_and_slide()

func GetValue():
	Global.playerpositionx = global_position.x
	Global.playerpositiony = global_position.y

func animatePlayer():
	if velocity.x<0:
		animations.play("left")
	elif velocity.x>0:
		animations.play("right")
	else:
		animations.play("up")

func movePlayer():
	velocity.x=0
	velocity.y=0
	
	#If the player 1 is the owl
	if Global.player1isowl:
		if Input.is_action_pressed("right"):
			velocity.x = Global.owlspeed
		elif Input.is_action_pressed("left"):
			velocity.x = -Global.owlspeed
		
		if Input.is_action_pressed("down"):
			velocity.y = Global.owlspeed
		elif Input.is_action_pressed("up"):
			velocity.y = -Global.owlspeed
	else: #If the player 2 is the owl
		if Input.is_action_pressed("right-D"):
			velocity.x = Global.owlspeed
		elif Input.is_action_pressed("left-A"):
			velocity.x = -Global.owlspeed
		
		if Input.is_action_pressed("down-S"):
			velocity.y = Global.owlspeed
		elif Input.is_action_pressed("up-W"):
			velocity.y = -Global.owlspeed
		


func _on_hurtbox_area_entered(area):
	if area.name == "enemyhitbox":
		#queue_free() #player die
		
		#Start a new game
		Global.changephase = true
		
		if Global.player1isowl:
			Global.player1isowl = false
		else:
			Global.player1isowl = true

func changephase():
	position.x = 1100
	position.y = 600

func endgame():
	pass
