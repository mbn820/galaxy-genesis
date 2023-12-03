class_name MoveInputComponent extends Node

@export var move_component: MoveComponent

func _input(event: InputEvent) -> void:
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	move_component.velocity = direction.normalized()
