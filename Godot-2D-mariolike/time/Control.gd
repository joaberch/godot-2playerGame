extends Control

var time_elapsed := 0.0
var title_textedit

# Called when the node enters the scene tree for the first time.
func _ready():
	title_textedit = $Label


func _process(delta: float) -> void:
	time_elapsed += delta
	title_textedit.text = "hello"
