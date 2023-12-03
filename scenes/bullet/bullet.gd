extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent

func _ready() -> void:
	scale_component.tween_scale(self)
	# remove object when out of view
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
