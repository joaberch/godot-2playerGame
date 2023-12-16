extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString

func _physics_process(_delta):
	getPosition()
	moveToAttackGoldKnight()
	animate()
	checkIfGameHasEnded()
	move_and_slide()

func getPosition():
	Global.redFrogPosition = position

func checkIfGameHasEnded():
	if Global.minigame2winner:
		queue_free()

func moveToAttackGoldKnight():
	if !Global.checkFrogAreAttacking:
		if position.x < Global.goldKnightPositionx-10:
			velocity.x = Global.redFrogVelocity
		elif position.x > Global.goldKnightPositionx+10:
			velocity.x = -Global.redFrogVelocity
		else:
			velocity.x = 0
	else:
		velocity.x = 0

func animate():
	if !Global.checkFrogAreAttacking:
		if velocity.x > 0:
			animationString = "jump"
			animation.flip_h = true
		elif velocity.x < 0:
			animationString = "jump"
			animation.flip_h = false
		else:
			animationString = "idle"
	else:
		animationString = "attack"
	animation.play(animationString)
