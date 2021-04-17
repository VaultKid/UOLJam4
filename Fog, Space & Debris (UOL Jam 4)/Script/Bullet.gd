extends Area2D


const BULLETSPEED = 5 #Geschwindigkeit der Bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	move()
	if position.y < -320: #loesche den Bullet, wenn sie außerhalb des Bildschirms ist
		queue_free()
	for body in self.get_overlapping_areas():
		if body.has_method("destroy") && body.is_alive:
			body.destroy() #zerstoere das getroffene
			queue_free() #zerstoere dich

func move(): 
	position.y -= BULLETSPEED
