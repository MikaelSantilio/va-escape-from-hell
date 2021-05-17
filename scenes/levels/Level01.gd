extends Node2D

var HUD = load("res://assets/objects/HUD.tscn").instance()

func _ready():
	# Set HUD
	Global.global_hp = 1000
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

	# Set Menu
	var coin_sound = load("res://assets/objects/CoinSound.tscn").instance()
	add_child(coin_sound)
	Global.coin_sound = coin_sound
	var PauseInterface = load("res://scenes/menu/PauseInterface.tscn").instance()
	add_child(PauseInterface)
	Global.level_id = get_instance_id()
