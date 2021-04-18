extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func clear():
	$AnimatedSprite2.play("test")
	$AnimatedSprite2.play("default")
	get_parent().get_node("AudioManager").playWipe()
	$AnimatedSprite.clear()
	
