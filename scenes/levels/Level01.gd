extends Node2D

var Settings = load("res://assets/objects/Settings.gd")
var PauseInterface = load("res://scenes/menu/PauseInterface.tscn").instance()
var vehicle
var HUD
var vehicle_settings
var settings
var RPM
var KMH


func _ready():
	settings = Settings.new()
	vehicle_settings = settings.players["jeep"]
	HUD = load("res://assets/objects/HUD.tscn").instance()
	add_child(HUD)
	vehicle = load(vehicle_settings.path).instance()
	vehicle.position = Vector2(18200, 860)
	
	
	var camera = vehicle.get_node("Camera2D")
	camera.limit_bottom = 960
	camera.limit_left = 40
	camera.limit_right = 41570
	add_child(vehicle)
	move_child(vehicle, 0)
	add_child(PauseInterface)
	move_child(PauseInterface, 0)


func _physics_process(delta):
	var velocity_label = HUD.get_node("Control").get_node("VelocityLabel")
	if vehicle:
		RPM = abs(vehicle.get_node("l_wheel").angular_velocity) / (2 * PI / 60)
		KMH = 0.1885 * RPM * (0.0127 * vehicle.get_node("l_wheel").get_node("Sprite").texture.get_size().y)
		var previous_value = int(velocity_label.text)
		if not(abs(previous_value - KMH) > 30 and KMH > previous_value):
			velocity_label.text = String(int(KMH))
		


func _on_FinishDetector_body_entered(body):
	print("Fim da corrida")
