extends Node2D

# Chargez la scène de l'ennemi (assurez-vous d'ajuster le chemin du fichier selon vos besoins)
var enemy_scene = preload("res://cible.tscn")
var timer = 0 #compte les frames

func _process(delta):
	timer+=1
	if timer % 50 == 0:	#how fast enemy spawn
		spawn_enemy()
		timer = 0

func _ready():
	# Exemple d'utilisation de la méthode spawn_enemy
	spawn_enemy()

func spawn_enemy():
	# Créez une nouvelle instance de la classe Enemy (ennemi)
	var new_enemy = enemy_scene.instantiate()
	
	# Définissez les coordonnées x et y aléatoires
	var random_x = randi() % int(get_viewport_rect().size.x)
	var random_y = randi() % int(get_viewport_rect().size.y)
	
	# Positionnez le nouvel ennemi aux coordonnées aléatoires
	new_enemy.position = Vector2(random_x, random_y)
	
	# Ajoutez le nouvel ennemi au nœud parent (dans ce cas, Node2D)
	add_child(new_enemy)
