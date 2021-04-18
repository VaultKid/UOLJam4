extends Node

var volume = -14.0

func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)

func playExplosion():
	$"ExplosionSFX".play(0.0)

func playUI1():
	$"UISFXPlayer1".play(0.0)
	
func playNewMinigame():
	$"NewMinigame".play(0.0)
	
func playClearMinigame():
	$"ClearMinigame".play(0.0)
	
func playClearArrow1():
	$"PlayArrow1".play(0.0)
	
func _on_Intro_Player_finished():
	$"Loop Player".play(0.0)

func _on_Loop_Player_finished():
	$"Loop Player".play(0.0)
