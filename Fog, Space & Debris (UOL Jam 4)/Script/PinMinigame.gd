extends Node

var rng = RandomNumberGenerator.new() 
var numbers = []
var pinActive = false
var pinPointer = 0
var waitStart = false
var cooldown = 7.0
var pinCount = 4
var darkRed = Color8(108, 9, 30)
var red = Color8(164, 56, 45)
var darkBlue = Color8(0, 51, 126)
var darkGreen = Color8(0, 108, 76)
var green = Color8(110, 204, 130)
var orange = Color8(255, 160, 116)
var white = Color8(232, 232, 255, 125)
var firstRoll = true

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	rollPin()
	firstRoll = false
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
	for num in range(pinCount):
		numbers.insert(num, rng.randi_range(1,9))
	print(numbers)
	$"Number1".text=String(numbers[0])
	$"Number2".text=String(numbers[1])
	$"Number3".text=String(numbers[2])
	$"Number4".text=String(numbers[3])
	changeTextColor(5, darkBlue)
	if(!firstRoll):
		get_parent().get_node("AudioManager").playNewMinigame()
	
	
func checkInput():
	if(Input.is_action_just_released("1") ):
		#print(1)
		checkNumbers(1)
	elif(Input.is_action_just_released("2") ):
		#print(2)
		checkNumbers(2)
	elif(Input.is_action_just_released("3") ):
		#print(3)
		checkNumbers(3)
	elif(Input.is_action_just_released("4") ):
		#print(4)
		checkNumbers(4)
	elif(Input.is_action_just_released("5") ):
		#print(5)
		checkNumbers(5)
	elif(Input.is_action_just_released("6") ):
		#print(6)
		checkNumbers(6)
	elif(Input.is_action_just_released("7") ):
		#print(7)
		checkNumbers(7)
	elif(Input.is_action_just_released("8") ):
		#print(8)
		checkNumbers(8)
	elif(Input.is_action_just_released("9") ):
		#print(9)
		checkNumbers(9)


func checkNumbers(var pressed):
	if (pressed == numbers[pinPointer]):
		#print("sick!")
		changeTextColor(pinPointer, green)
		pinPointer += 1
		get_parent().get_node("AudioManager").playUI1()
		#print("PinPointer:")
		#print(pinPointer)
	else:
		#print("loser")
		pinPointer = 0
		changeTextColor(5, darkBlue)
		get_parent().get_node("AudioManager").playNewMinigame()
	if (pinPointer >= pinCount):
		pinPointer = 0
		pinActive = false
		changeTextColor(5, white)
		get_parent().get_node("Fog").blowFog()
		get_parent().get_node("AudioManager").playClearMinigame()
		#print("nice you won!")

func changeTextColor(var pinPointer, var color):
	if (pinPointer <= 0):
		$"Number1".add_color_override("font_color", color)
	elif (pinPointer == 1):
		$"Number2".add_color_override("font_color", color)
	elif (pinPointer == 2):
		$"Number3".add_color_override("font_color", color)
	elif (pinPointer == 3):
		$"Number4".add_color_override("font_color", color)
	else:
		$"Number1".add_color_override("font_color", color)
		$"Number2".add_color_override("font_color", color)
		$"Number3".add_color_override("font_color", color)
		$"Number4".add_color_override("font_color", color)
