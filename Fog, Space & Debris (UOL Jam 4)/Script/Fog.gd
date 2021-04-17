extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0.1

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	position.y += speed

func blowFog():
	position.y -= 80

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
