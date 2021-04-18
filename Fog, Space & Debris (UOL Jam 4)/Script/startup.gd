extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$"StartUpAudioPlayer".play(0.0)
	yield(get_tree().create_timer(4.5), "timeout")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),  -14)
	get_tree().change_scene("res://Szenen/Menu.tscn") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
