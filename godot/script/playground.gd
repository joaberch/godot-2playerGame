extends Node2D

# Chargez la scène de l'ennemi (assurez-vous d'ajuster le chemin du fichier selon vos besoins)
var enemy_scene = preload("res://cible.tscn")
var timer = 0 #compte les frames
var score = 0 #compte le score
var boolean = false

func _process(_delta):
	timer+=1
	if timer % 40 == 0:	#how fast enemy spawn
		spawn_enemy()
		timer = 0

func _ready():
	# Exemple d'utilisation de la méthode spawn_enemy
	if !boolean:
		Global.score = 0
		boolean = true
	
	spawn_enemy()
	
	var score_label = Label.new()
	score_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	score_label.vertical_alignment = VERTICAL_ALIGNMENT_TOP
	score_label.text = "Score: " + str(Global.score)
	add_child(score_label)

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
