extends Node
var score = 0
var menuselector = 1
var enemy_frame_selection1 = 50

#Scene
var HomeMenu = preload("res://menu.tscn").instantiate()
var SelectionMenu1 = preload("res://selection_menu_1.tscn").instantiate()
var Game1 = preload("res://playground.tscn").instantiate()
var enemy_scene = preload("res://cible.tscn").instantiate()
