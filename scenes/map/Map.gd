extends Node2D

# Get nodes reference
#export (NodePath) var line12
#export (NodePath) var line23
#export (NodePath) var line34
#export (NodePath) var line45
#export (NodePath) var line56
#export (NodePath) var line67

# Called when the node enters the scene tree for the first time.
func _ready():
	_get_reference_nodes()
	
func _get_reference_nodes():
	var b1 = get_node("ButtonLevel1")
	var b2 = get_node("ButtonLevel2")
	var b3 = get_node("ButtonLevel3")
	var b4 = get_node("ButtonLevel4")
	var b5 = get_node("ButtonLevel5")
	var b6 = get_node("ButtonLevel6")
	var b7 = get_node("ButtonLevel7")
	
	var list_buttons = [b2,b3,b4,b5,b6,b7]
	_set_disabled_buttons(list_buttons)
	
	var l12 = get_node("LineL12")
	var l23 = get_node("LineL23")
	var l34 = get_node("LineL34")
	var l45 = get_node("LineL45")
	var l56 = get_node("LineL56")
	var l67 = get_node("LineL67")
	
	var list_lines = [l12,l23,l34,l45,l56,l67]
	_set_disabled_lines(list_lines)

func _set_disabled_buttons(list_buttons):
	for i in list_buttons:
		_disable_button(i)
	
func _disable_button(button):
	if (button.disabled == false):
		button.disabled = true

func _set_disabled_lines(list_lines):
	for i in list_lines:
		_disable_line(i)
		
func _disable_line(line):
	if (line.visible == true):
		line.visible = false
	
func _enable_button(button):
	if (button.disabled == true):
		button.disabled = false
		
		var line = _equivalent_line(button)
		_enable_line(get_node(line))
	
func _equivalent_line(button):
	var line = "";
	
	match button.name:
		"ButtonLevel2":
			line = "LineL12"
		"ButtonLevel3":
			line = "LineL23"
		"ButtonLevel4":
			line = "LineL34"
		"ButtonLevel5":
			line = "LineL45"
		"ButtonLevel6":
			line = "LineL56"
		"ButtonLevel7":
			line = "LineL67"
	
	return line
	
func _enable_line(line):
	if (line.visible == false):
		line.visible = true


# Change scene when button pressed
func _on_ButtonLevel1_pressed():
	get_tree().change_scene("res://scenes/levels/Level01.tscn")


func _on_ButtonLevel2_pressed():
	get_tree().change_scene("res://scenes/levels/Level02.tscn")


func _on_ButtonLevel3_pressed():
	get_tree().change_scene("res://scenes/levels/Level03.tscn")


func _on_ButtonLevel4_pressed():
	get_tree().change_scene("res://scenes/levels/Level04.tscn")


func _on_ButtonLevel5_pressed():
	get_tree().change_scene("res://scenes/levels/Level05.tscn")


func _on_ButtonLevel6_pressed():
	get_tree().change_scene("res://scenes/levels/Level06.tscn")


func _on_ButtonLevel7_pressed():
	get_tree().change_scene("res://scenes/levels/Level07.tscn")
