extends KinematicBody2D

onready var animation_player = $AnimationPlayer
onready var timer = $ResetTimer

export var reset_time : float = 1.0

var velocity = Vector2()

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += 1000 * delta
	position += velocity * delta

func _on_Area2D_body_entered(body):
	animation_player.play("ShakePlatform")
	velocity = Vector2.ZERO
	print("Plataforma quebradica")


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
	timer.start(reset_time)

func _on_ResetTimer_timeout():
	queue_free()
