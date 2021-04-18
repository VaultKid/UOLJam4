extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(str(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))))





func _on_start_pressed():
	
	get_tree().change_scene("res://Szenen/Game.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene("res://Szenen/Options.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Szenen/Credits.tscn")
