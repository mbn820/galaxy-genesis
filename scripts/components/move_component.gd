class_name MoveComponent extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var ship_stats: ShipStats

func _process(delta: float) -> void:
	actor.translate(velocity * delta * ship_stats.speed)
	
func is_moving_left() -> bool:
	return velocity.x < 0
	
func is_moving_right() -> bool:
	return velocity.x > 0
