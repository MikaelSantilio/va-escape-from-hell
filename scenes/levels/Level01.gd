extends Node2D

var Settings = load("res://assets/objects/Settings.gd")

func _ready():
	var settings = Settings.new()
	var vehicle_settings = settings.players["police_car"]
	var vehicle = load(vehicle_settings.path).instance()
	vehicle.position = Vector2(18200, 860)
	var camera = vehicle.get_node("Camera2D")
	camera.limit_bottom = 960
	add_child(vehicle)
	move_child(vehicle, 0)
