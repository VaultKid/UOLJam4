extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func small_shake():
	$Screenshake.start(0.1, 15, 4, 0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func gameEndShake():
	$Screenshake.start(0.5, 30, 10, 1)
