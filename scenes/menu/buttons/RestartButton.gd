extends Button

func _on_RestartButton_button_up():
	Global.coins = 0
	get_tree().paused = false
	print('restart')
	get_tree().reload_current_scene()
	
