class_name FlashComponent extends Node

@export var flash_effect: Material
@export var sprite: CanvasItem
@export var flash_duration: float = 0.2

var original_sprite_material: Material
var timer: Timer = Timer.new()

func _ready() -> void:
	add_child(timer)
	original_sprite_material = sprite.material
	timer.timeout.connect(func():
		sprite.material = original_sprite_material
	)

func flash() -> void:
	sprite.material = flash_effect
	timer.start(flash_duration)
