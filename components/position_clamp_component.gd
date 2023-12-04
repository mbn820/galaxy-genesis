class_name PositionClampComponent extends Node

@export var actor: Node2D
@export var top_margin: int = 8
@export var bottom_margin: int = 8
@export var left_margin: int = 8
@export var right_margin: int = 8

var top_border: int = 0
var bottom_border: int = ProjectSettings.get("display/window/size/viewport_height")
var left_border: int = 0
var right_border: int = ProjectSettings.get("display/window/size/viewport_width")

func _process(delta: float) -> void:
	actor.position.x = clamp(actor.position.x, left_border + left_margin, right_border - right_margin)
	actor.position.y = clamp(actor.position.y, top_border + top_margin, bottom_border - bottom_margin)
