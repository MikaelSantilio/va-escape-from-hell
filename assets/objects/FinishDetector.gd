extends Area2D

func _on_FinishDetector_body_entered(body):
	var WinnerScreen = load("res://scenes/menu/WinnerScreen.tscn").instance()
	WinnerScreen.get_node("WinnerInterface/WinnerOverlay").visible = true
	instance_from_id(Global.level_id).add_child(WinnerScreen)
	Global.other_screen_open = true
	Global.global_coins = Global.coins
	Global.coins = 0
