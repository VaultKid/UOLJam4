extends Node

var rng = RandomNumberGenerator.new() 
var numbers = []
var pinActive = false
var pinPointer = 0
var waitStart = false
var cooldown = 30.0

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	#rollPin()
	pass # Replace with function body.
		
		
#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (pinActive):
		checkInput()
	if (!pinActive && !waitStart):
		waitStart = true
		print("yeild start")
		yield(get_tree().create_timer(cooldown), "timeout")
		print("yeild end")
		rollPin()
		waitStart = false	


func rollPin():
	pinActive = true
	numbers = []
	for num in range(6):
		numbers.insert(num, rng.randi_range(1,9))
	print(numbers)
	
	
func checkInput():
	if(Input.is_action_just_released("1") ):
		print(1)
		checkNumbers(1)
	elif(Input.is_action_just_released("2") ):
		print(2)
		checkNumbers(2)
	elif(Input.is_action_just_released("3") ):
		print(3)
		checkNumbers(3)
	elif(Input.is_action_just_released("4") ):
		print(4)
		checkNumbers(4)
	elif(Input.is_action_just_released("5") ):
		print(5)
		checkNumbers(5)
	elif(Input.is_action_just_released("6") ):
		print(6)
		checkNumbers(6)
	elif(Input.is_action_just_released("7") ):
		print(7)
		checkNumbers(7)
	elif(Input.is_action_just_released("8") ):
		print(8)
		checkNumbers(8)
	elif(Input.is_action_just_released("9") ):
		print(9)
		checkNumbers(9)


func checkNumbers(var pressed):
	if (pressed == numbers[pinPointer]):
		print("sick!")
		pinPointer += 1
		print("PinPointer:")
		print(pinPointer)
	else:
		print("loser")
		pinPointer = 0
	if (pinPointer >= 6):
		pinPointer = 0
		pinActive = false
		print("nice you won!")
