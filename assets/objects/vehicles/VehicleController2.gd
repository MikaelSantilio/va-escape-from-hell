extends RigidBody2D

export var SPEED = 8
export var hp = 1000
export var is_on_lava = false
export var is_on_rollover = false
export var lava_damage = 300
onready var timer = $RolloverTimer
export var reset_time : float = 2.5

func _physics_process(delta):

	if Input.is_action_pressed("ui_right"):
		$r_wheel.angular_velocity += SPEED
		$l_wheel.angular_velocity += SPEED

	elif Input.is_action_pressed("ui_left"):
		$r_wheel.angular_velocity -= SPEED
		$l_wheel.angular_velocity -= SPEED
	
	elif not is_on_lava and Input.is_action_pressed("ui_up"):
		rotation_degrees -= 0.5
	
	elif not is_on_lava and Input.is_action_pressed("ui_down"):
		rotation_degrees += 0.5

	if is_on_lava and hp > 0:
		if hp < lava_damage:
			hp = 0
		else:
			hp -= lava_damage
		print(hp)

func _on_LavaDetector_area_entered(area):
	is_on_lava = true
	print('Entrou na lava')


func _on_LavaDetector_area_exited(area):
	is_on_lava = false
	print('Saiu da lava')

func _on_RolloverDetector_body_entered(body):
	print('Capotou')
	is_on_rollover = true
	timer.start(reset_time)


func _on_RolloverTimer_timeout():
	if is_on_rollover:
		print('End game')


func _on_RolloverDetector_body_exited(body):
	print('Descapotou')
	is_on_rollover = false
