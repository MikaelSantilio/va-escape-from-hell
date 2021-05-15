extends Node2D

var Settings = load("res://assets/objects/Settings.gd")

func _ready():
	var settings = Settings.new()
	var vehicle_settings = settings["monster"]
	var vehicle = load(vehicle_settings.path).instance()
	vehicle.start_position = Vector2(18200, 860)
	add_child(vehicle)
