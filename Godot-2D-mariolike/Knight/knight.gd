extends CharacterBody2D

@onready var animation = $SpriteSheet/AnimationPlayer
@onready var attackCooldown = $attackCooldown

var stringanimation = "downIdle"
var direction
var weapon = "fist"
var checkAttack
var checkIsAttacking
var cptr = 0

func _physics_process(_delta):
	moveplayer()
	getPosition()
	animateplayer()
	attack()
	move_and_slide()

func attack():
	if velocity.x == 0 && velocity.y == 0:
		if !checkAttack:
			checkAttack = true
			attackCooldown.start()
		++cptr
		if cptr >= 50:
			cptr = 0
			checkIsAttacking = false

func getPosition():
	Global.knightpositionx = global_position.x
	Global.knightpositiony = global_position.y

func moveplayer():
	velocity.x=0
	velocity.y=0
	
	if Input.is_action_pressed("right"):
		velocity.x = Global.knightspeed
	elif Input.is_action_pressed("left"):
		velocity.x = -Global.knightspeed
	
	if Input.is_action_pressed("down"):
		velocity.y = Global.knightspeed
	elif Input.is_action_pressed("up"):
		velocity.y = -Global.knightspeed

func animateplayer():
	if !checkIsAttacking:
		if velocity.x > 0:
			stringanimation = "right"
			direction = "right"
		elif velocity.x < 0:
			stringanimation = "left"
			direction = "left"
		
		if velocity.y > 0:
			stringanimation = "down"
			direction = "down"
		elif velocity.y < 0:
			stringanimation = "up"
			direction = "up"
		
		if velocity.x == 0 && velocity.y == 0:
			if direction == "left":
				stringanimation = "leftIdle"
			elif direction == "right":
				stringanimation = "rightIdle"
			elif direction == "down":
				stringanimation = "downIdle"
			elif direction == "up":
				stringanimation = "upIdle"
			else:
				stringanimation = "RESET"
			
	animation.play(stringanimation)


func _on_attack_cooldown_timeout():
	checkAttack = false
	if velocity.x == 0 && velocity.y == 0:
		print("attack")
		checkIsAttacking = true
		if direction == "right":
			stringanimation = "attackRight"
		elif direction == "left":
			stringanimation = "attackLeft"
		elif direction == "down":
			stringanimation = "attackDown"
		else:
			stringanimation = "attackUp"
		


