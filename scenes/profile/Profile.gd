extends Node2D

func _ready():
	pass # Replace with function body.


func _on_ProfileBack_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")



func _on_MonsterButton_pressed():
	Global.vehicle_selected = Global.players["monster"]
	get_tree().change_scene("res://scenes/menu/Menu.tscn")


func _on_FerrariButton_pressed():
	Global.vehicle_selected = Global.players["sport"]
	get_tree().change_scene("res://scenes/menu/Menu.tscn")


func _on_PoliceButton_pressed():
	Global.vehicle_selected = Global.players["police_car"]
	get_tree().change_scene("res://scenes/menu/Menu.tscn")


func _on_JeepButton_pressed():
	Global.vehicle_selected = Global.players["jeep"]
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
