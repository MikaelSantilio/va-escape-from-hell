extends Node2D

func _ready():
	pass

func _on_menuStartGame_pressed():
	get_tree().change_scene("res://scenes/map/Map.tscn")


func _on_menuProfile_pressed():
	get_tree().change_scene("res://scenes/profile/Profile.tscn")


func _on_menuExit_pressed():
	get_tree().quit()

