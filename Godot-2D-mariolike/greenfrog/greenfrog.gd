extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString

func _physics_process(delta):
	moveToAttackKnight()
	animate()
	move_and_slide()

func moveToAttackKnight():
	if position.x < Global.knightpositionx-10:
		velocity.x = Global.greenFrogVelocity
	elif position.x > Global.knightpositionx+10:
		velocity.x = -Global.greenFrogVelocity
	else:
		velocity.x = 0
		attack()

func animate():
	if velocity.x > 0:
		animationString = "jump"
		animation.flip_h = true
	elif velocity.x < 0:
		animationString = "jump"
		animation.flip_h = false
	else:
		animationString = "idle"
	animation.play(animationString)

func attack():
	pass
