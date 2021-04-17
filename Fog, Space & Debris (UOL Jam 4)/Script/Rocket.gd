extends Area2D


# Declare member variables here. Examples:
# var a = 2
var is_alive = true #Ob der Asteroid fest ist und noch zerstoert werden kann
var speed = 2.5 #Fluggeschwindigkeit des Asteroids
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += speed
	if position.y > 320: #loesche Asteroid, wenn er außerhalb des Bildschirms ist
		queue_free()

func destroy():
	get_parent().get_node("HUD").score += 2 #+1 Score
	queue_free() #zerstoere dich
