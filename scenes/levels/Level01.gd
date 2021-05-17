extends Node2D

var HUD = load("res://assets/objects/HUD.tscn").instance()

func _ready():
	# Set HUD
	add_child(HUD)
	# Spawning Vehicle
	var vehicle = load(Global.vehicle_selected.path).instance()
	vehicle.position = Vector2(18200, 860)
	add_child(vehicle)
	move_child(vehicle, 0)
	
	# Set Camera Limits
	var camera = vehicle.get_node("Camera2D")
	camera.limit_bottom = 960
	camera.limit_left = 40
	camera.limit_right = 41570

	# Set Pause Menu
	var PauseInterface = load("res://scenes/menu/PauseInterface.tscn").instance()
	add_child(PauseInterface)
	move_child(PauseInterface, 0)
