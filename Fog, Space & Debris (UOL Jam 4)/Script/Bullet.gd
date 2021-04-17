extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const BULLETSPEED = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_parent().get_node("Player").position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	move()
	if position.y < -320:
		queue_free()
	for body in self.get_overlapping_bodies():
		if body.has_method("destroy") && body.is_alive:
			body.destroy()
			queue_free()

func move():
	position.y -= BULLETSPEED
