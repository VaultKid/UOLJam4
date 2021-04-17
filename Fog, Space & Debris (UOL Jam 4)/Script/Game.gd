extends Node2D


# Declare member variables here. Examples:
var currentCooldown = 0 #aktuelle Ticks, bis der naechste Asteroid gespawnt wirds
var cooldown = 60 #Ticks zwisched dem Spawnen von Asteroiden
var spawnRdy = true #Ob ein Asteroid gespawnt werden kann
var rng = RandomNumberGenerator.new() 
var spectrumStart = 0.5
var spectrumEnd = 4.5
const DIFFICULTY = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	spectrumStart = 1.5 - (cooldown/60)
	spectrumEnd = 5 - (cooldown/60)
	if spawnRdy: #Zähle den Cooldown bis der nächste Asteroid gespawnt ist
		rng.randomize()
		var rngNumber = int(round(rng.randf_range(spectrumStart, spectrumEnd)))
		if rngNumber <= 1:
			spawnSatellite()
		elif rngNumber == 2:
			
			spawnAsteroid() 
		elif rngNumber == 3:
			spawnAsteroid2()
		else:
			spawnRocket()
		currentCooldown = cooldown
		spawnRdy = false
		if cooldown > 10:
			cooldown -= DIFFICULTY
	elif currentCooldown <= 0:
		spawnRdy = true
	else:
		currentCooldown -= 1



	

func spawnSatellite():
	rng.randomize()
	var rngNumber = rng.randf_range(-110.0, 110.0) #Erzeuge zufaellige Position
	var satellites = preload("res://Szenen/Satellite.tscn")
	var satellite = satellites.instance() #spawn Rocket
	satellite.set_position(Vector2(320 + rngNumber , -10))
	self.add_child(satellite)

func spawnRocket():
	rng.randomize()
	var rngNumber = rng.randf_range(-120.0, 120.0) #Erzeuge zufaellige Position
	var rockets = preload("res://Szenen/Rocket.tscn")
	var rocket = rockets.instance() #spawn Rocket
	rocket.set_position(Vector2(320 + rngNumber , -10))
	self.add_child(rocket)

func spawnAsteroid():
	rng.randomize()
	var rngNumber = rng.randf_range(-120.0, 120.0) #Erzeuge zufaellige Position
	var asteroids = preload("res://Szenen/Astroid.tscn")
	var asteroid = asteroids.instance() #spawn Asteroid
	asteroid.set_position(Vector2(320 + rngNumber , -10))
	self.add_child(asteroid)
	
func spawnAsteroid2():
	rng.randomize()
	var rngNumber = rng.randf_range(-120.0, 120.0) #Erzeuge zufaellige Position
	var asteroids2 = preload("res://Szenen/Astroid2.tscn")
	var asteroid2 = asteroids2.instance() #spawn Asteroid
	asteroid2.set_position(Vector2(320 + rngNumber , -10))
	self.add_child(asteroid2)
	
