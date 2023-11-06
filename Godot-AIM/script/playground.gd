extends Node2D

var enemy_scene = preload("res://cible.tscn")
var timer1 = 0 #compte les frames
var score = 0 #compte le score
var boolean = false #start the game

func _process(_delta):
	timer1+=1
	if timer1 % Global.enemy_frame_selection1 == 0:	#how fast enemy spawn
		spawn_enemy()
		timer1 = 0

func _ready():
	# Mettre le score à 0 au début
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
