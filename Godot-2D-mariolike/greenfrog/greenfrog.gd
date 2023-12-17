extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString
var checkIsHurt
var lifePoint = Global.greenFrogLifePoint

func _physics_process(_delta):
	getPosition()
	moveToAttackKnight()
	animate()
	checkIfGameHasEnded()
	move_and_slide()
	if lifePoint < 1:
		killFrog()

func killFrog():
	queue_free()
	Global.checkGreenFrogIsAlive = false

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
	if !checkIsHurt:
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
			if Global.checkGreenFrogCanAttack:
				animationString = "attack"
			else:
				animationString = "idle"
	else:
		animationString = "hit"
	animation.play(animationString)

func _on_frog_hitbox_area_entered(area):
	if area.name == "hitboxShuriken":
		lifePoint -= 1
		checkIsHurt = true
		if animationString == "attack":
			Global.checkGreenFrogCanAttack = false

func _on_animated_sprite_2d_animation_finished():
	if checkIsHurt:
		checkIsHurt = false
