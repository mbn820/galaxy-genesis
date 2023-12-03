class_name HitBoxComponent extends Area2D

@export var tag: String
@export var damage: float = 1.0

signal hurtbox_entered(hurtbox: Area2D)

func _ready() -> void:
	area_entered.connect(on_hurtbox_entered)
	
func on_hurtbox_entered(hurtbox: Area2D) -> void:
	if not hurtbox is HurtBoxComponent: return
	hurtbox_entered.emit(hurtbox)
