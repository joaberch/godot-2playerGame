extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var timerAttackCooldown = $AttackCooldown
var animationString
var Shuriken = preload("res://shuriken/shuriken.tscn")

func _physics_process(_delta):
	moveToAttackKnight()
	animate()
	checkIfGameHasEnded()
	move_and_slide()

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
		attack()

func animate():
	if velocity.x > 0:
		animationString = "jump"
		animation.flip_h = true
	elif velocity.x < 0:
		animationString = "jump"
		animation.flip_h = false
	else:
		attack()
		animationString = "attack"
	animation.play(animationString)

func attack():
	timerAttackCooldown.start()


func _on_attack_cooldown_timeout():
	print("green frog attack")
	Shuriken.instantiate()
	#add_child(Shuriken)
