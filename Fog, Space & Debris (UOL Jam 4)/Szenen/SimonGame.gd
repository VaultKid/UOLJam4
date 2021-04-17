extends Node2D


# Declare member variables here. Examples:
# var a = 2
var combinations = [0,0,0,0,0,0,0,0]
var rng = RandomNumberGenerator.new() 
var maxLength = 4
var currentLength = 0
var step = 0
var currentCooldown = 0
const COOLDOWN = 30
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
	print(str(i))

func playTrue(i):
	print(str(i) + "correct")

func playFalse(i):
	print(str(i) + "false")

func reward():
	print("gewonnen")

func computerTurn():
	if currentCooldown <= 0:
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
			play(combinations[step])
			step += 1
			currentCooldown = COOLDOWN
		elif currentLength < maxLength:
			step = 0
			currentLength += 1
			player = true
			
	else:
		currentCooldown -= 1



func playerTurn():
	var playerInput = getInput()
	if playerInput != 0:
		if playerInput == combinations[step]:
			playTrue(playerInput)
			if step < currentLength - 1:
				step += 1
			else:
				step = 0
				player = false
				
		else:
			playFalse(playerInput)
			scramble()
			player = false
			step = 0
			currentLength = 0
			currentCooldown = COOLDOWN




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

func scramble():
	for i in range(0, combinations.size()):
		rng.randomize()
		combinations[i] = rng.randi_range(1,4)
		

func arrowKeyPressed():
	return Input.is_action_just_pressed("simonDown")||Input.is_action_just_pressed("simonUp")||Input.is_action_just_pressed("simonLeft")||Input.is_action_just_pressed("simonRight")
