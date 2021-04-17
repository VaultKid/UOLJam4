extends Node

var volume = -6.0

func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)
	pass # Replace with function body.

func playExplosion():
	$"ExplosionSFX".play(0.0)
	pass

func _on_Intro_Player_finished():
	$"Loop Player".play(0.0)
	pass # Replace with function body.


func _on_Loop_Player_finished():
	$"Loop Player".play(0.0)
	pass # Replace with function body.
