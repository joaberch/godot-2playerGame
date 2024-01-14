extends CharacterBody2D

func _ready():
	position.y = 100
	position.x = randi_range(1, 8) * 250

func _physics_process(delta):
	move_and_slide()


func _on_enemy_hitbox_area_entered(area):
	if area.name == "hitboxAmmo":
		print("enemy loose a life point")
