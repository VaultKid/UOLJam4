extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
var score = 0
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (get_parent().gameOver == false):
		time +=1;
		$Highscore.text = str(score) #aktuallisiere das Lable
		$Timer.text = str(round(time/60))
