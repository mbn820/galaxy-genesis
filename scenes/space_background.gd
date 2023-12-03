extends ParallaxBackground

@export var scroll_speed: float = 0.1

func _process(delta: float) -> void:
	scroll_offset.y += scroll_speed
	
