extends Area2D


# Declare member variables here. Examples:
# var a = 2
var is_alive = true
const SPEED = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += SPEED
	if position.y > 320:
		queue_free()

func destroy():
	get_parent().get_node("HUD").score += 1
	queue_free()
