extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")


func _on_body_entered(body):
	anim_player.play("fade_out")
	Global.play_coin_sound()
	Global.coins += 1
	queue_free()
