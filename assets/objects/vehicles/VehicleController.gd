extends RigidBody2D

export var SPEED = 8
export var CAN_ROTATE = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$r_wheel.angular_velocity += SPEED
		$l_wheel.angular_velocity += SPEED

	elif Input.is_action_pressed("ui_left"):
		$r_wheel.angular_velocity -= SPEED
		$l_wheel.angular_velocity -= SPEED
	
	elif CAN_ROTATE and Input.is_action_pressed("ui_up"):
		rotation_degrees -= 0.5
	
	elif CAN_ROTATE and Input.is_action_pressed("ui_down"):
		rotation_degrees += 0.5
