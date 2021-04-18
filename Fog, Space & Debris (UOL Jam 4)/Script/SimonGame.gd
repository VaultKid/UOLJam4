extends Node2D


# Declare member variables here. Examples:
# var a = 2
var combinations = [0,0,0,0,0,0,0,0]
var rng = RandomNumberGenerator.new() 
var maxLength = 4
var currentLength = 0
var step = 0
var currentCooldown = 0
const COOLDOWN = 20
var activated = false
var player = false

# Called when the node enters the scene tree for the first time.
func _ready():
	scramble()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		if !player:
			computerTurn()
		else:
			playerTurn()
	else:
		activated = arrowKeyPressed()

func play(i):
	getArrow(i).play("blue")

func playTrue(i):
	getArrow(i).play("green")

func playFalse(i):
	getArrow(i).play("red")

func reward():
	get_parent().get_node("Fog2").clear()


func computerTurn():
	if currentCooldown <= 0:
		resetCollors()
		if currentLength == maxLength:
			step = 0
			currentLength = 0
			reward()
			scramble()
			player = false
			step = 0
			currentLength = 0
			activated = false
		elif step <= currentLength:
			resetCollors()
			play(combinations[step])
			playArrow(combinations[step])
			step += 1
			currentCooldown = COOLDOWN
		elif currentLength < maxLength:
			step = 0
			currentLength += 1
			player = true
			
	else:
		if currentCooldown < 5:
			resetCollors()
		currentCooldown -= 1



func playerTurn():
	var playerInput = getInput()
	if playerInput != 0:
		if playerInput == combinations[step]:
			resetCollors()
			playTrue(playerInput)
			playArrow(playerInput)
			if step < currentLength - 1:
				step += 1
			else:
				step = 0
				player = false
				currentCooldown = COOLDOWN * 2
				get_parent().get_node("AudioManager").playClearMinigame()
				
		else:
			resetCollors()
			playFalse(playerInput)
			playArrow(playerInput)
			scramble()
			player = false
			step = 0
			currentLength = 0
			currentCooldown = COOLDOWN

func playArrow(i):
	if i == 1:
		get_parent().get_node("AudioManager").playArrow1()
	if i == 2:
		get_parent().get_node("AudioManager").playArrow2()
	if i == 3:
		get_parent().get_node("AudioManager").playArrow3()
	if i == 4:
		get_parent().get_node("AudioManager").playArrow4()

func getArrow(i):
	if i == 1:
		return $Up
	if i == 2:
		return $Left
	if i == 3:
		return $Down
	if i == 4:
		return $Right

func getInput():
	if Input.is_action_just_pressed("simonUp"):
		return 1
	elif Input.is_action_just_pressed("simonLeft"):
		return 2
	elif Input.is_action_just_pressed("simonDown"):
		return 3
	elif Input.is_action_just_pressed("simonRight"):
		return 4
	else:
		return 0

func resetCollors():
	$Up.play("default")
	$Left.play("default")
	$Down.play("default")
	$Right.play("default")

func scramble():
	for i in range(0, combinations.size()):
		rng.randomize()
		combinations[i] = rng.randi_range(1,4)
		

func arrowKeyPressed():
	return Input.is_action_just_pressed("simonDown")||Input.is_action_just_pressed("simonUp")||Input.is_action_just_pressed("simonLeft")||Input.is_action_just_pressed("simonRight")
