extends Area2D


# Declare member variables here:
var xDirection = 0 #Input x Richtung
var yDirection = 0 #Input y Richtung
var shootRdy = true #Kann gerade geschossen werden?
var currentBulletCooldown = 0 #aktuelle Ticks bis wieder geschossen werden kann
const SPEED = 2 #Raumschiff geschwindigkeit
const BULLET = preload("res://Szenen/Bullet.tscn") #halte Bullet zum instanziieren bereit
const BULLETCOOLDOWN = 20 #Warteticks zwischen Schuessen


func _ready():
	pass 



func _process(_delta):
	movement() #Bewege Raumschiff
	shoot() #Schieße
	collisionTest() #Schau, ob du getroffen wurdest
	if Input.is_action_just_released("ui_cancel"): #Schau, ob geschlossen werden soll
		get_tree().quit() #Schließe game

func collisionTest():
	if !get_parent().gameOver:
		for bodie in self.get_overlapping_areas():
			if bodie.is_alive: #Schau, ob ein Objekt, was das Schiff getroffen hat noch lebt
				gameOver() #Spiel verloren
			
	

func gameOver():
	get_parent().gameOver = true
	get_parent().get_node("GameOverUi").show()
	get_parent().get_node("AudioManager").stopLoopPlayer()
	get_parent().get_node("AudioManager").playGameOver()
	$"AnimatedSprite".hide()
	#get_tree().reload_current_scene() #restarte game

func shoot():
	if shootRdy: #Schaue, ob geschossen werden kann
		if Input.is_action_pressed("shoot"): #,ob geschossen werden soll
			var bullet = BULLET.instance() #Erstelle Zwei Kugeln an der Position der Kanonen
			bullet.set_position(position + Vector2(-19, -4))
			get_parent().add_child(bullet)
			bullet = BULLET.instance()
			bullet.set_position(position + Vector2(19, -4))
			get_parent().add_child(bullet)
			shootRdy = false #Setze neuen Cooldown
			currentBulletCooldown = BULLETCOOLDOWN
	elif currentBulletCooldown == 0: #Naechster Schuss bereit
		shootRdy = true
	else:
		currentBulletCooldown -= 1 #verringere Cooldown

func movement(): #Addiere die Tastendrücke zu einem 1D Vektor
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
	
	self.position.x += xDirection * SPEED #Bewege das Schiff in die Richtungen
	self.position.y += yDirection * SPEED
	



