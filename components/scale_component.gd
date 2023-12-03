class_name ScaleComponent extends Node

@export var scale_value: Vector2 = Vector2(1.5, 1.5)
@export var scale_duration: float = 0.5

func tween_scale(node: Node2D) -> void:
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.tween_property(node, "scale", scale_value, scale_duration * 0.1).from_current()
	tween.tween_property(node, "scale", Vector2.ONE, scale_duration * 0.9).from(scale_value)
