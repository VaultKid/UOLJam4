extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentCooldown = 0
const COOLDOWN = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a8 = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if modulate.a8 < 255 && currentCooldown == 0:
		modulate.a8 += 1
		currentCooldown = COOLDOWN
	else:
		currentCooldown -= 1

func clear():
	print("clear")
	modulate.a8 -= 125
