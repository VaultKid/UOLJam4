extends Area2D


# Declare member variables here:
var xDirection = 0
var yDirection = 0
var shootRdy = true
var bulletCooldown = 0
const SPEED = 2
const BULLET = preload("res://Szenen/Bullet.tscn")
const SHOOTINGCOOLDOWN = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement()
	shoot(delta)
	


func shoot(delta):
	if shootRdy:
		if Input.is_action_pressed("shoot"):
			var bullet = BULLET.instance()
			bullet.set_position(position + Vector2(-19, -4))
			get_parent().add_child(bullet)
			bullet = BULLET.instance()
			bullet.set_position(position + Vector2(19, -4))
			get_parent().add_child(bullet)
			shootRdy = false
			bulletCooldown = SHOOTINGCOOLDOWN
	elif bulletCooldown == 0:
		shootRdy = true
	else:
		bulletCooldown -= 1

func movement():
	xDirection = 0
	yDirection = 0
	if Input.is_action_pressed("left") && self.position.x > 210:
		xDirection -= 1
	if Input.is_action_pressed("right") && self.position.x < 430:
		xDirection += 1
	if Input.is_action_pressed("down") && self.position.y < 290:
		yDirection += 1
	if Input.is_action_pressed("up") && self.position.y > 250:
		yDirection -= 1
	
	self.position.x += xDirection * SPEED
	self.position.y += yDirection * SPEED
	



