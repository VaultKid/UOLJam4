extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func clear():
	$AnimatedSprite2.play("test")
	$AnimatedSprite2.play("default")
	$AnimatedSprite.clear()
