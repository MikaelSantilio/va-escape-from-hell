extends RigidBody2D

onready var b_wheel = get_node("back_wheel")
onready var f_wheel = get_node("front_wheel")

func _process(delta):
	
	if (Input.is_action_pressed("press_D")):
		b_wheel.apply_torque_impulse(300)
		f_wheel.apply_torque_impulse(300)
