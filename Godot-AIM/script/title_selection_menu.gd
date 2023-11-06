extends Control

var title_textedit

func _ready():
	# Référencez le nœud TextEdit dans la scène une fois qu'il est prêt
	title_textedit = $TextEdit

func _process(_delta):
	if title_textedit: #Check if it is not null to prevent a major issue
		
		if Global.menuselector == 1:
			title_textedit.text = "\t\t\t\t\t\t\t\t\t\tMode de jeu n°" + str(Global.menuselector) + "\nCible immobile apparaissant toutes les " + str(Global.enemy_frame_selection1) + " frames.\nPour modifier la fréquence d'apparition des ennemies\naller dans les paramètres."
			
