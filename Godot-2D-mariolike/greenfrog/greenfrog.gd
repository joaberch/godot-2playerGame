extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString

func _physics_process(_delta):
	getPosition()
	moveToAttackKnight()
	animate()
	checkIfGameHasEnded()
	move_and_slide()

func getPosition():
	Global.greenFrogPosition = position

func checkIfGameHasEnded():
	if Global.minigame2winner:
		queue_free()

func moveToAttackKnight():
	if position.x < Global.knightpositionx-10:
		velocity.x = Global.greenFrogVelocity
	elif position.x > Global.knightpositionx+10:
		velocity.x = -Global.greenFrogVelocity
	else:
		velocity.x = 0

func animate():
	if velocity.x > 0:
		animationString = "jump"
		animation.flip_h = true
	elif velocity.x < 0:
		animationString = "jump"
		animation.flip_h = false
	else:
		animationString = "attack"
	animation.play(animationString)
