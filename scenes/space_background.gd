extends ParallaxBackground

@export var scroll_speed: float = 0.2

func _process(delta: float) -> void:
	scroll_offset.y += scroll_speed * delta
	
	var x_axis = Input.get_axis('left', 'right')
	scroll_offset.x += x_axis * (scroll_speed / 4) * delta
	
#func _input(event: InputEvent) -> void:
	#var x_axis = Input.get_axis('left', 'right')
	#scroll_offset.x += x_axis * scroll_speed
