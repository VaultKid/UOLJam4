extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("HBoxContainer/VBoxContainer/HSlider").value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master") + 200)
	pass
	




func _on_back_pressed():
	get_tree().change_scene("res://Szenen/Menu.tscn")






func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
