extends Node2D

var Settings = load("res://assets/objects/Settings.gd")
var vehicle
var vehicle_settings
var settings


func _ready():
	settings = Settings.new()
	vehicle_settings = settings.players["monster"]
	vehicle = load(vehicle_settings.path).instance()
	vehicle.position = Vector2(17890, 594)
	var camera = vehicle.get_node("Camera2D")

	camera.limit_bottom = 960
	camera.limit_left = 40
	camera.limit_right = 32530
	add_child(vehicle)
	
	move_child(vehicle, 0)

func _on_FinishDetector_body_entered(body):
	print("Fim da corrida")
