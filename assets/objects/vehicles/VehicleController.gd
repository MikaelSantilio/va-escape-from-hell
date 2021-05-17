extends RigidBody2D

export var SPEED = 8
export var lava_damage = 10

export var max_speed : int = 300
export var acceleration : float = 2000.0
export var max_torque_impulse : int = 30000

var speed : float = 0.0
var is_on_lava = false
var is_rollover = false
onready var timer = $RolloverTimer
export var reset_time : float = 2.5
var player_die = false


func _physics_process(delta):
	
	Global.kmh = calculate_speed_kmh($r_wheel)

	if calculate_speed_kmh($r_wheel) < max_speed and not is_on_lava and Input.is_action_pressed("ui_right"):
		# $r_wheel.angular_velocity += SPEED
		# $l_wheel.angular_velocity += SPEED

		speed += acceleration
		speed = clamp(speed, speed, max_torque_impulse)
		$l_wheel.apply_torque_impulse(speed)
		$r_wheel.apply_torque_impulse(speed)


	elif calculate_speed_kmh($r_wheel) < max_speed and not is_on_lava and Input.is_action_pressed("ui_left"):
		#$r_wheel.angular_velocity -= SPEED
		#$l_wheel.angular_velocity -= SPEED
		
		speed -= acceleration
		speed = clamp(speed, -max_torque_impulse, speed)
		$l_wheel.apply_torque_impulse(speed)
		$r_wheel.apply_torque_impulse(speed)
	
	elif not is_on_lava and Input.is_action_pressed("ui_up"):
		rotation_degrees -= 0.5
	
	elif not is_on_lava and Input.is_action_pressed("ui_down"):
		rotation_degrees += 0.5

	if is_on_lava and Global.global_hp > 0:
		if Global.global_hp < lava_damage:
			Global.global_hp = 0
		else:
			Global.global_hp -= lava_damage
	
	if Global.global_hp <= 0 and not player_die:
		var DieScreen = load("res://scenes/menu/DScreen.tscn").instance()
		# var die_screen = instance_from_id(Global.die_screen_id).get_node("DieInterface/DieOverlay")
		instance_from_id(Global.level_id).add_child(DieScreen)
		player_die = true
		Global.other_screen_open = true
		#instance_from_id(Global.winner_screen_id).queue_free()
		#instance_from_id(Global.pause_screen_id).queue_free()

func calculate_speed_kmh(wheel: RigidBody2D) -> int:
		var rpm = abs(wheel.angular_velocity) / (2 * PI / 60)
		var wheel_size = wheel.get_node("Sprite").texture.get_size().y
		return int(0.1885 * rpm * 0.0127 * wheel_size)

func _on_LavaDetector_area_entered(area):
	is_on_lava = true
	print('Entrou na lava')


func _on_LavaDetector_area_exited(area):
	is_on_lava = false
	print('Saiu da lava')

func _on_RolloverDetector_body_entered(body):
	print('Capotou')
	is_rollover = true
	timer.start(reset_time)


func _on_RolloverTimer_timeout():
	if is_rollover:
		Global.global_hp = 0


func _on_RolloverDetector_body_exited(body):
	print('Descapotou')
	is_rollover = false
