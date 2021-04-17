extends Node2D


# Declare member variables here. Examples:
var currentCooldown = 0 #aktuelle Ticks, bis der naechste Asteroid gespawnt wirds
const COOLDOWN = 30 #Ticks zwisched dem Spawnen von Asteroiden
var spawnRdy = true #Ob ein Asteroid gespawnt werden kann
var rng = RandomNumberGenerator.new() 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if spawnRdy: #Zähle den Cooldown bis der nächste Asteroid gespawnt ist
		spawnAsteroid() 
		currentCooldown = COOLDOWN
		spawnRdy = false
	elif currentCooldown == 0:
		spawnRdy = true
	else:
		currentCooldown -= 1



func spawnAsteroid():
	rng.randomize()
	var rngNumber = rng.randf_range(-120.0, 120.0) #Erzeuge zufaellige Position
	var asteroids = preload("res://Szenen/Astroid.tscn")
	var asteroid = asteroids.instance() #spawn Asteroid
	asteroid.set_position(Vector2(320 + rngNumber , -10))
	self.add_child(asteroid)
	
