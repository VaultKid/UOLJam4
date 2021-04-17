extends ParallaxBackground


export (float) var scrolling_speed = 90.0

func _process(delta):
	scroll_offset.y += scrolling_speed * delta
	$ParallaxLayer2.motion_offset.y += scrolling_speed * delta * 0.1
	$ParallaxLayer3.motion_offset.y  += scrolling_speed * delta * 0.2
