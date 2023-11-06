extends Control

var score_textedit

func _ready():
	# Référencez le nœud TextEdit dans la scène une fois qu'il est prêt
	score_textedit = $TextEdit

func _process(_delta):
	# Mettez à jour le contenu du TextEdit avec le score actuel
	if score_textedit:
		score_textedit.text = "Score: " + str(Global.score)
