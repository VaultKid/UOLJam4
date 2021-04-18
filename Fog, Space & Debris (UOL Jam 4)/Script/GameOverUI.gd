extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gameOver = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gameOver = get_parent().gameOver


func _on_PlayAgainButton_pressed():
	get_tree().reload_current_scene() #restarte game
