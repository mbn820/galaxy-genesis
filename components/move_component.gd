class_name MoveComponent extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var speed: float = 100

func _process(delta: float) -> void:
	actor.translate(velocity * delta * speed)
	
func is_moving_left() -> bool:
	return velocity.x < 0
	
func is_moving_right() -> bool:
	return velocity.x > 0
