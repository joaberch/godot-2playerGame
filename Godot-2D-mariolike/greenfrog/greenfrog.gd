extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString
var checkIsHurt

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
	if !Global.checkFrogAreAttacking || !checkIsHurt:
		if position.x < Global.knightpositionx-10:
			velocity.x = Global.greenFrogVelocity
		elif position.x > Global.knightpositionx+10:
			velocity.x = -Global.greenFrogVelocity
		else:
			velocity.x = 0
	else:
		velocity.x = 0

func animate():
	if !Global.checkFrogAreAttacking:
		if !checkIsHurt:
			if velocity.x > 0:
				animationString = "jump"
				animation.flip_h = true
			elif velocity.x < 0:
				animationString = "jump"
				animation.flip_h = false
			else:
				animationString = "idle"
		else:
			animationString = "hit"
	else:
		animationString = "attack"
	animation.play(animationString)

func _on_frog_hitbox_area_entered(area):
	if area.name == "hitboxShuriken":
		checkIsHurt = true

func _on_animated_sprite_2d_animation_finished():
	if checkIsHurt:
		checkIsHurt = false
