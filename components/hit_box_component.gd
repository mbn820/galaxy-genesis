class_name HitBoxComponent extends Area2D

@export var tag: String
@export var damage: float = 1.0
# will continously damage target every x seconds as long as the collision overlaps
# default to 100 to simulate one time damage
@export var hit_rate_seconds: float = 100

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var timer: Timer = Timer.new()

signal hurtbox_entered(hurtbox: Area2D)

func _ready() -> void:
	add_child(timer)
	timer.autostart = true
	timer.start(hit_rate_seconds)
	timer.timeout.connect(toggle_collision)
	
	area_entered.connect(on_hurtbox_entered)
	
func on_hurtbox_entered(hurtbox: Area2D) -> void:
	if not hurtbox is HurtBoxComponent: return
	hurtbox_entered.emit(hurtbox)
	
func toggle_collision() -> void:
	collision_shape_2d.disabled = not collision_shape_2d.disabled
