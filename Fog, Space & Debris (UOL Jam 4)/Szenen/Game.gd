extends Node2D


# Declare member variables here. Examples:
var currentCooldown = 0
const COOLDOWN = 30
var spawnRdy = true
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawnRdy:
		spawnAsteroid()
	elif currentCooldown == 0:
		spawnRdy = true
	else:
		currentCooldown -= 1



func spawnAsteroid():
	rng.randomize()
	var rngNumber = rng.randf_range(-120.0, 120.0)
	var asteroids = preload("res://Szenen/Astroid.tscn")
	var asteroid = asteroids.instance()
	asteroid.set_position(Vector2(320 + rngNumber , -10))
	self.add_child(asteroid)
	currentCooldown = COOLDOWN
	spawnRdy = false
