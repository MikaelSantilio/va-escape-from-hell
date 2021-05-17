extends Button

export var reference_path = ""
export(bool) var start_focused = false

func _ready():
	if (start_focused):
		grab_focus()
	
	_connect_on_Button()
	
	
func _connect_on_Button():
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")
		
		
func _on_Button_mouse_entered():
	print("focus")
	grab_focus()
	
	
func _on_Button_Pressed():
	print_tree()
	if (reference_path != ""):
		get_tree().change_scene(reference_path)
	else:
		get_tree().quit()


func _on_Button_button_up():
	print("presionado")


func _on_Button_button_down():
	print("down")
