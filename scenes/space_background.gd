extends ParallaxBackground

@export var scroll_speed: float = 10

func _process(delta: float) -> void:
	scroll_offset.y += scroll_speed * delta
