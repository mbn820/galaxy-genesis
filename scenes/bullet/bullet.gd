extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var hit_box_component: HitBoxComponent = $HitBoxComponent as HitBoxComponent

func _ready() -> void:
	scale_component.tween_scale(self)
	# remove object when out of view or if an enemy is hit
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hit_box_component.hurtbox_entered.connect(func(hurtbox: HurtBoxComponent):
		if hurtbox.tag == 'enemy':
			queue_free()
	)
